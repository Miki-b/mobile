# 📝 Task Manager App

A **Flutter app** for managing your daily tasks. Built with **Flutter**, **Riverpod** for state management, and **SQLite** for local data persistence.

---

## 📱 Features

- ✅ Add tasks with validation
- ✔️ Mark tasks as completed
- 🗑️ Delete tasks
- 🔍 Filter tasks (All, Completed, Pending)
- 💾 Local data storage using SQLite
- 🎨 Modern UI with theming (Blue + White)

---

## 📸 Screenshots

<p float="left">
  <img src="https://github.com/user-attachments/assets/0458d058-689b-44fd-ba53-9e50b67e189f" width="30%" />
  <img src="https://github.com/user-attachments/assets/9c75def0-b30e-4ed6-83ab-b05ac183b0f8" width="30%" />
</p>

---

## 🎥 Demo

[![Watch the Demo](https://img.youtube.com/vi/1pdhDv6LRN2h/0.jpg)](https://drive.google.com/file/d/1pdhDv6LRN2hHc1LVoYjbNpXE-yJVQy9x/view?usp=sharing)

> _Click the image above to view the full demo on Google Drive._

---

## 🛠️ Tech Stack

- **Flutter**
- **Riverpod** – State management
- **SQLite (`sqflite`)** – Local data persistence
- **Material Design 3** – UI Components

---

## 🚀 Getting Started

### 📦 Clone the repository

```bash
git clone https://github.com/Miki-b/mobile.git
cd task_manager
Run the app
```



```bash
flutter run
```
✅ Note: Make sure to use Android NDK 27.0.12077973
(You can verify or change it in android/app/build.gradle.kts if build errors occur.)
```bash
###📂 Folder Structure


lib/
├── main.dart
├── models/
│   └── task.dart
├── providers/
│   └── task_provider.dart
├── db/
│   └── db_helper.dart
```
