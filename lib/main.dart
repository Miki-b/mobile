import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/task_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.white,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.blue),
        ),
      ),
      home: TaskHomePage(),
    );
  }
}

class TaskHomePage extends ConsumerWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(filteredTasksProvider);
    final filter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Task Manager"),
        actions: [
          PopupMenuButton<Filter>(
            onSelected: (value) =>
            ref.read(filterProvider.notifier).state = value,
            itemBuilder: (context) => [
              PopupMenuItem(value: Filter.all, child: Text('All')),
              PopupMenuItem(value: Filter.completed, child: Text('Completed')),
              PopupMenuItem(value: Filter.pending, child: Text('Pending')),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter task',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    final title = _controller.text.trim();
                    if (title.isNotEmpty) {
                      ref.read(taskListProvider.notifier).addTask(title);
                      _controller.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Title cannot be empty")),
                      );
                    }
                  },
                  child: Text("Add"),
                )
              ],
            ),
          ),
          Expanded(
            child: tasks.isEmpty
                ? Center(
              child: Text(
                "No tasks",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
                : ListView.separated(
              itemCount: tasks.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) {
                      ref
                          .read(taskListProvider.notifier)
                          .toggleCompletion(task);
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => ref
                        .read(taskListProvider.notifier)
                        .deleteTask(task.id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
