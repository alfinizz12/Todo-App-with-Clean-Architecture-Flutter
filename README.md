# 📝 Simple Todo App  
### Flutter + Clean Architecture + GetX

---

## 📌 Overview

Simple Todo App adalah aplikasi manajemen tugas sederhana yang dibangun menggunakan **Flutter** dengan menerapkan prinsip **Clean Architecture** dan state management **GetX**.

Walaupun fiturnya sederhana (CRUD Todo), project ini dirancang dengan struktur arsitektur yang scalable dan maintainable seperti aplikasi production-level.

Project ini dibuat untuk mempelajari dan mengimplementasikan:

- Separation of Concerns
- Clean Architecture Pattern
- Dependency Injection
- Reactive State Management (GetX)
- Modular Feature Structure

---

## 🏗️ Architecture

Project ini menggunakan pendekatan **Clean Architecture**, yang membagi sistem menjadi 3 layer utama:

### 1️⃣ Presentation Layer
Berisi:
- Pages / Views
- GetX Controllers
- Bindings (Dependency Injection)

Layer ini hanya menangani UI dan interaksi user.

---

### 2️⃣ Domain Layer
Berisi:
- Entities
- Repository Interfaces
- Use Cases

Layer ini merupakan inti dari business logic dan **tidak bergantung pada framework apapun**.

---

### 3️⃣ Data Layer
Berisi:
- Models
- Repository Implementations
- Data Sources (Local / Remote)

Layer ini bertanggung jawab terhadap pengambilan dan pengelolaan data.

---

## 📂 Project Structure
```
lib/
│
├── core/
│
├── features/
│ └── todo/
│ ├── data/
│ │ ├── datasource/
│ │ ├── models/
│ │ └── repositories/
│ │
│ ├── domain/
│ │ ├── entities/
│ │ ├── repositories/
│ │ └── usecases/
│ │
│ └── presentation/
│   ├── pages/
│   ├── controllers/
│   └── bindings/
│
└── main.dart
```

---

## 🚀 Features

- ✅ Add Todo
- 📋 View Todo List
- ✏️ Edit Todo
- ❌ Delete Todo
- 🔄 Reactive UI using GetX
- 🧩 Dependency Injection with GetX Bindings

---

## 🛠️ Tech Stack

- **Flutter**
- **GetX**
  - State Management
  - Dependency Injection
  - Routing
- Clean Architecture Pattern

---

## 🎯 Learning Objectives

Project ini dibuat untuk:

- Memahami implementasi Clean Architecture pada Flutter
- Memisahkan business logic dari UI
- Menggunakan Use Case sebagai mediator logic
- Mengimplementasikan dependency injection dengan GetX
- Membuat struktur project yang scalable sejak awal

---

## 📌 Notes

Walaupun aplikasi ini sederhana, struktur dibuat seperti aplikasi skala besar agar mudah dikembangkan lebih lanjut, seperti:

- Integrasi REST API
- Local Database (Hive / Sqflite)
- Authentication
- Testing (Unit & Widget Test)

---

## 🧑‍💻 Author

Dikembangkan sebagai bagian dari pembelajaran Clean Architecture dan best practice Flutter development.