import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/db_helper.dart';
import '../models/task.dart';

enum Filter { all, completed, pending }

final filterProvider = StateProvider<Filter>((ref) => Filter.all);

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>((ref) {
  return TaskListNotifier(ref);
});

class TaskListNotifier extends StateNotifier<List<Task>> {
  final Ref ref;
  TaskListNotifier(this.ref) : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    state = await DatabaseHelper.instance.getTasks();
  }

  Future<void> addTask(String title) async {
    if (title.isEmpty) return;
    final task = Task(title: title);
    await DatabaseHelper.instance.insertTask(task);
    await loadTasks();
  }

  Future<void> toggleCompletion(Task task) async {
    final updated = Task(id: task.id, title: task.title, isCompleted: !task.isCompleted);
    await DatabaseHelper.instance.updateTask(updated);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await DatabaseHelper.instance.deleteTask(id);
    await loadTasks();
  }
}

final filteredTasksProvider = Provider<List<Task>>((ref) {
  final filter = ref.watch(filterProvider);
  final tasks = ref.watch(taskListProvider);

  switch (filter) {
    case Filter.completed:
      return tasks.where((t) => t.isCompleted).toList();
    case Filter.pending:
      return tasks.where((t) => !t.isCompleted).toList();
    default:
      return tasks;
  }
});
