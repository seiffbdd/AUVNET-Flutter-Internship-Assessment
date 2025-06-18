# Nawel App - Flutter Clean Architecture

## 📱 Overview

Nawel is a Flutter-based mobile application that integrates Firebase services such as authentication and Firestore. The app is built using a **Clean Architecture** approach to ensure high modularity, testability, and scalability. The app uses modern Flutter practices such as BLoC state management, dependency injection via `get_it`, and well-defined layer separation.

---

## 🏗 Architectural Overview

The architecture follows the **Clean Architecture** pattern, which divides the codebase into 3 main layers:

### 1. **Presentation Layer**

- **Role**: Handles UI and user interactions.
- **Structure**: Uses `Bloc/Cubit` for state management.
- **Components**: Widgets, Pages, Cubits/Blocs, Events, States
- **Example**: `SplashCubit`, `SignupBloc`, `HomeScreen`

### 2. **Domain Layer**

- **Role**: Contains business logic and use cases.
- **Structure**: Stateless, logic-centric classes.
- **Components**: Entities, Repositories (abstract), UseCases
- **Example**: `SignupUseCase`, `ListenToAuthChangesUseCase`

### 3. **Data Layer**

- **Role**: Manages API calls, Firebase, local storage (e.g., SharedPreferences).
- **Structure**: Implements domain repositories.
- **Components**: Models, DataSources, Repository Implementations
- **Example**: `AuthRepoImpl`, `SplashFirebaseServiceImpl`, `SharedPrefsHelper`

---

## 🧠 Rationale for Clean Architecture

### ✅ Separation of Concerns

Each layer has a clear responsibility, minimizing coupling and improving maintainability.

### ✅ Testability

Business logic in the domain layer is easily testable without relying on Flutter or Firebase.

### ✅ Scalability

As the project grows (e.g., more features like cart, orders, profile settings), you can extend layers independently without breaking existing code.

### ✅ Reusability

Use cases and repositories can be reused across different presentation strategies (e.g., switching from Bloc to Riverpod).

---

## 🔧 Technologies Used

- **Flutter**
- **Firebase Auth** & **Cloud Firestore**
- **BLoC** for state management
- **GetIt** for dependency injection
- **SharedPreferences** for local persistence
- **Dartz** for functional programming (`Either`)

---

## 🗂 Folder Structure

```
lib/
├── core/              # Shared logic & utilities (e.g., service locator, use_case, constants)
├── config/            # App-wide configs (e.g., routes, themes, images)
├── features/
│   ├── auth/          # Login, Signup, Logout
│   ├── splash/        # Splash logic and onboarding check
│   ├── home/          # Home page services, shortcuts, etc.
│   └── ...            # More features
│
│   └── feature_name/
│       ├── data/      # Data sources, models, repo impl
│       ├── domain/    # UseCases, Entities, Abstract Repos
│       └── presentation/ # UI widgets, Cubits/Blocs
```

---

## 🚀 Getting Started

1. Clone the repository.
2. Run `flutter pub get`.
3. Make sure Firebase is configured properly (`google-services.json` / `GoogleService-Info.plist`).
4. Run the app using a real device or supported emulator.

---

## 🤝 Contribution & License

This project is built for educational and practical use in mobile app development. Contributions and suggestions are welcome!

