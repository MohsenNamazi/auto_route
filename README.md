# Auto Route Flutter App

Flutter app showcasing clean architecture with `auto_route`, tabbed navigation, nested tab stacks, and guarded navigation parameters.

## Features

- Bottom navigation with 5 tabs (Home, Search, Cart, Likes, Profile), each with its own nested stack
- Single detail page (`ScreenAPage`) that receives a nullable entity (`title`, `description`)
- Guard (`NonNullEntityGuard`) blocks navigation when params are null; tab buttons A/B pass valid data, C passes null and is rejected
- Persistent tab state and visible bottom nav while navigating
- FVM-ready (`fvm flutter ...`)

## Requirements

- Flutter SDK (via FVM): 3.27.4
- Dart 3.6.x

## Setup

```bash
cd /Users/mohsen.namazi/Desktop/auto_route
fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## Run

```bash
# list devices
fvm flutter devices

# run on an emulator/device
fvm flutter run -d <device-id>
```

## Project Structure (partial)

```
lib/
├── core/
│   └── router/
│       ├── app_router.dart          # Routes + guards wiring
│       ├── app_router.gr.dart       # Generated (ignored by git)
│       └── guards/non_null_entity_guard.dart
├── presentation/
│   └── pages/
│       ├── main_navigation/main_navigation_page.dart
│       ├── tabs/                    # Tab UIs + wrapper pages
│       └── screens/screen_a_page.dart # Single detail page
└── main.dart
```

## Notes

- `app_router.gr.dart` is ignored; regenerate with `build_runner` when routes change.
- Use FVM commands (`fvm flutter ...`) to avoid SDK drift.

