
# mobile
task manager app
📝 Task Manager
A Flutter app for managing your daily tasks. Built with Flutter, Riverpod for state management, and SQLite for local data persistence.

📱 Features
✅ Add tasks with validation

✔️ Mark tasks as completed

🗑 Delete tasks

🔍 Filter tasks (All, Completed, Pending)

💾 Data saved locally using SQLite

🎨 Modern UI with theming (Blue + White)

📸 Screenshots
Home	Add Task	Filter Tasks

![image](https://github.com/user-attachments/assets/0458d058-689b-44fd-ba53-9e50b67e189f)
![image](https://github.com/user-attachments/assets/9c75def0-b30e-4ed6-83ab-b05ac183b0f8)


🎥 Demo
![Demo Video]]([https://github.com/Miki-b/mobile.gi](https://drive.google.com/file/d/1pdhDv6LRN2hHc1LVoYjbNpXE-yJVQy9x/view?usp=sharing)t)
🛠️ Tech Stack
Flutter

Riverpod – State management

SQLite (sqflite) – Local storage

Material Design 3 – UI Components

🚀 Getting Started
Clone the repo

bash
Copy
Edit
git clone https://github.com/Miki-b/mobile.git
cd task_manager
Install dependencies

bash
Copy
Edit
flutter pub get
Run the app

bash
Copy
Edit
flutter run
✅ Make sure to use Android NDK 27.0.12077973 (see error notes in android/app/build.gradle.kts).

📂 Folder Structure
css
Copy
Edit
lib/
├── main.dart
├── models/
│   └── Task.dart
├── providers/
│   └── task_provider.dart
├── db/
│   └──db_helper.dart

