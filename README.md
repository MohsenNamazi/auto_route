# Auto Route Flutter App

A Flutter application demonstrating clean architecture with auto_route package.

## Features

- Clean Architecture structure
- Bottom navigation bar with 5 tabs (Home, Search, Cart, Likes, Profile)
- Each tab has 3 buttons to navigate to screens A, B, and C
- Screens A, B, C maintain bottom navigation bar visibility
- Persistent bottom navigation state

## Setup

1. Install dependencies:
```bash
flutter pub get
```

2. Generate route files:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── core/
│   └── router/
│       └── app_router.dart          # Auto route configuration
├── presentation/
│   └── pages/
│       ├── main_navigation/
│       │   └── main_navigation_page.dart  # Bottom nav bar
│       ├── tabs/                    # Tab screens
│       └── screens/                 # Screens A, B, C
└── main.dart                        # App entry point
```

## Architecture

The app follows clean architecture principles:
- **Presentation Layer**: UI components and pages
- **Core Layer**: Router configuration and shared utilities

