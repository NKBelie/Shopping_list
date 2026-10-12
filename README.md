# Shopping List — Flutter App

A simple, interactive shopping list application built with **Flutter and Dart** as part of the Mobile Programming course at the AUCA Innovation Center.

The app helps users manage everyday shopping items by adding products, marking them as bought, deleting items, and clearing completed items.

##  Screenshots

### Phone Screen
![Phone Screen](Screenshot/Phone%20Screen.png)

### Dart Warm-up
![Warm-up](Screenshot/Warmup.png)

### Cancel Seat Exercise
![Cancel Seat](Screenshot/cancel.png)

## Features

- **View shopping items** — Start with Milk, Bread, and Rice.
- **Add items** — Enter an item and add it to the list.
- **Input validation** — Prevent empty items from being added.
- **Delete items** — Remove individual items from the list.
- **Mark as bought** — Cross out purchased items and mark them with a check.
- **Track remaining items** — Display the number of items left to buy.
- **Clear bought items** — Remove all purchased items at once.

## Technologies Used

- **Flutter** — Cross-platform application framework.
- **Dart** — Programming language.
- **Material Design** — Flutter's built-in UI components.
- **Android Studio** — Development environment.
- **Git and GitHub** — Version control and project hosting.

## Getting Started

### Prerequisites

Install the following tools before running the application:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Android Studio](https://developer.android.com/studio)
- [Git](https://git-scm.com/downloads)

### Installation

1. Clone this repository:

   ```bash
   git clone YOUR_GITHUB_REPOSITORY_URL
   ```

2. Navigate to the project directory:

   ```bash
   cd shopping_list
   ```

3. Install the project dependencies:

   ```bash
   flutter pub get
   ```

4. Check available devices:

   ```bash
   flutter devices
   ```

5. Run the application:

   ```bash
   flutter run
   ```

## Project Structure

```text
shopping_list/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── test/
├── web/
├── Screenshot/
├── pubspec.yaml
├── pubspec.lock
|__ warmup.dart
└── README.md
```

##  Learning Outcomes

This project introduces fundamental Flutter and Dart concepts:

- Classes, objects, and named parameters.
- Functions as values and button callbacks.
- Widgets and widget composition.
- `StatelessWidget` and `StatefulWidget`.
- Managing application state with `setState()`.
- Building lists with `ListView.builder`.
- Handling user input with `TextField` and `TextEditingController`.
- Input validation and feedback using `SnackBar`.
- Managing item state with a custom `Item` model.
- Updating the user interface in response to user interactions.

##  Testing the Application

To test the application:

1. Launch the app and verify that Milk, Bread, and Rice appear.
2. Add a new item and confirm that the input field clears.
3. Try adding an empty item and verify that a validation message appears.
4. Delete an item and confirm that only the selected item disappears.
5. Mark an item as bought and verify that its name is crossed out.
6. Unmark the item and confirm that it returns to the active shopping list.
7. Clear bought items and verify that completed items are removed.

##  Limitations

The shopping list uses in-memory state. Items may be lost when the application is completely restarted because persistent storage has not been implemented.

##  Course Information

**Course:** Mobile Programming  
**Institution:** Adventist University of Central Africa (AUCA)  
**Program:** Innovation Center  
**Session:** Week 2 — Session 3  
**Project:** Your First Flutter App — The Shopping List

##  Author

**Belie NDAYISABA KAMARIZA**

GitHub: [@NKBelie](https://github.com/NKBelie)

---

*Built while learning Flutter and Dart, one widget at a time.*
