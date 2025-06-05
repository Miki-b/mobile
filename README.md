# mobile
task manager app
📝 Task Manager
A simple and elegant Flutter app for managing your daily tasks. Built with Flutter, Riverpod for state management, and SQLite for local data persistence.

📱 Features
✅ Add tasks with validation

✔️ Mark tasks as completed

🗑 Delete tasks

🔍 Filter tasks (All, Completed, Pending)

💾 Data saved locally using SQLite

🎨 Modern UI with theming (Blue + White)

📸 Screenshots
Home	Add Task	Filter Tasks

📁 Add your screenshots to assets/images/ and update the paths above accordingly.

🎥 Demo
🔽 Embed a short demo here (MP4/GIF/WebM)

css
Copy
Edit
![Demo Video](assets/video/demo.gif)
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
git clone https://github.com/your-username/task_manager.git
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
│   └── task_model.dart
├── providers/
│   └── task_provider.dart
├── db/
│   └── task_db.dart
