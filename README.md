# 🩸 Blood Donating App (Flutter + Firebase)

A Flutter-based mobile application designed to connect blood donors with people in need.  
The app uses **Firebase Authentication** and **Cloud Firestore** for secure user management and data handling.

---

## 🚀 Features

- 🔐 Firebase Email & Password Authentication
- 🔁 Forgot Password (Email reset)
- 🧾 User Registration & Login
- 🏠 Auth-based Navigation (Splash → Login → Home)
- 👤 User Profile Setup
- 📝 Create Blood Donation Posts
- 🔔 Snackbar-based Error & Success Feedback
- 🧠 State Management using **Riverpod**
- 📱 Cross-platform (Android & iOS)

---

## 🛠 Tech Stack

- **Flutter (Dart)**
- **Firebase Authentication**
- **Cloud Firestore**
- **Riverpod (State Management)**
- **Material UI**

---

## 📁 Project Structure

lib/
│
├── core/
│ └── utils/
│ └── snackbar.dart
│
├── features/
│ ├── auth/
│ │ ├── data/
│ │ ├── domain/
│ │ ├── presentation/
│ │ └── providers/
│ │
│ ├── create_post/
│ │ └── presentation/
│ │
│ └── profile/
│ └── presentation/
│
├── firebase_options.dart ❌ (ignored in git)
└── main.dart

---

## 🔐 Firebase Setup (Required)

This project does **NOT** include Firebase configuration files for security reasons.

After cloning the repository, you **must configure Firebase locally**.

### 1️⃣ Create Firebase Project
- Go to: https://console.firebase.google.com
- Create a new project
- Enable:
  - **Authentication → Email/Password**
  - **Cloud Firestore**

---

### 2️⃣ Configure FlutterFire

Install FlutterFire CLI (once):

```bash
dart pub global activate flutterfire_cli
flutterfire configure
This will generate the following files locally (DO NOT COMMIT):

android/app/google-services.json

ios/Runner/GoogleService-Info.plist

lib/firebase_options.dart
flutter pub get
flutter run
### ⚠️ Important Notes

Firebase config files are ignored via .gitignore

Do NOT commit:

google-services.json

GoogleService-Info.plist

firebase_options.dart

Always validate forms before submitting authentication requests

Email must exist and password must match for login
🧪 Authentication Flow
Splash Screen
   ↓
Check Auth State
   ↓
Logged In? ── Yes → Home Screen
        └─ No  → Login Screen

🧩 State Management

Uses Flutter Riverpod

Authentication state handled via AuthNotifier

UI reacts to loading, success, and error states

👨‍💻 Author

Shahid
Flutter Developer

📜 License

This project is for educational and portfolio purposes.
