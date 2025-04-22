# Blinkit Home Screen Flutter App

## Overview

This is a Flutter application that replicates the home screen of a grocery delivery app similar to Blinkit. The app allows users to browse products by category, view product details, and add items to their cart. It features a clean UI with category filters, a product grid, and a bottom navigation bar for easy navigation.

### Features
- **Category Filters**: Users can filter products by categories such as All, Dry Fruits & Masala, Cold Drinks & Juices, Sweet Tooth, Instant & Frozen Food, and Vegetables.
- **Product Grid**: Displays products with details like image, name, weight, price, MRP, discount percentage, and an "Add" button.
- **Welcome Banner**: A visually appealing banner with a welcome message and call-to-action.
- **Bottom Navigation Bar**: Includes tabs for Home, Order Again, Categories, and Print.
- **State Management**: Uses the `provider` package to manage product data and filter states.

## Screenshots

### Home Screen with Vegetables Category
Below is a screenshot of the home screen displaying the "Vegetables" category. It shows a grid of products including Broccoli, Red & Yellow Bell Pepper, Cabbage, and Green Kiwi.

![Vegetables Category Screenshot](screenshots/vegetables_category.png)

*Note*: Replace `screenshots/vegetables_category.png` with the actual path to your screenshot once you add it to the repository.

## Prerequisites

Before running the app, ensure you have the following installed:
- **Flutter SDK**: Version 3.0.0 or higher
- **Dart**: Comes with Flutter
- **Android Studio** or **VS Code** with Flutter and Dart plugins
- **An emulator** (e.g., Android Emulator, iOS Simulator) or a physical device

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/blinkit-flutter-app.git
   cd blinkit-flutter-app
   ```

2. **Install Dependencies**:
   Navigate to the project directory and run the following command to install the required packages:
   ```bash
   flutter pub get
   ```

   The app uses the following dependencies (check `pubspec.yaml` for the full list):
   - `flutter`
   - `provider` (for state management)
   - `Other dependencies as needed` (e.g., for networking, image loading)

3. **Set Up an Emulator or Device**:
   - For Android: Launch an emulator via Android Studio or connect a physical device with USB debugging enabled.
   - For iOS: Launch the iOS Simulator or connect an iPhone with developer mode enabled.

## How to Run the App

1. **Ensure an Emulator/Device is Running**:
   - Run the following command to list available devices:
     ```bash
     flutter devices
     ```
   - If no device is detected, start an emulator or connect a device.

2. **Run the App**:
   - From the project directory, execute:
     ```bash
     flutter run
     ```
   - This will build and launch the app on the selected device/emulator.

3. **Debugging** (Optional):
   - To run in debug mode with hot reload:
     ```bash
     flutter run --debug
     ```

## Project Structure

- `lib/`
  - `Screens/`
    - `Home_screen.dart`: Contains the main home screen with category filters and product grid.
  - `Widgets/`
    - `custom_app_bar.dart`: Custom `AppBar` with category filter chips.
    - `offer_card.dart`: Widget for displaying offers.
    - `product_card.dart`: Widget for rendering individual product cards.
  - `Providers/`
    - `product_provider.dart`: Manages product data and categories.
  - `main.dart`: Entry point of the app.

## Potential Improvements

If given more time, the following enhancements could be added to improve the app:

- **GPS Integration for Location**:
  - Use the `geolocator` package to fetch the user's location automatically.
  - Example: Display nearby stores or adjust product availability based on the user's location.
  - Dependency: Add `geolocator: ^9.0.2` to `pubspec.yaml`.

- **Caching with Hive**:
  - Implement `hive` for caching user data, such as recently viewed products or cart items, to improve performance and offline capabilities.
  - Dependency: Add `hive: ^2.2.3` and `hive_flutter: ^1.1.0` to `pubspec.yaml`.

- **Push Notifications**:
  - Integrate push notifications using `firebase_messaging` to notify users about new offers, order updates, or reminders.
  - Example: Send a notification when a new discount is available in the "Vegetables" category.
  - Dependency: Add `firebase_messaging: ^14.0.0` to `pubspec.yaml` and set up Firebase.

- **Additional Features**:
  - Add a search functionality in the `AppBar` to allow users to search for products.
  - Implement a cart system to store selected items and display a cart icon with a badge in the `BottomNavigationBar`.
  - Enhance the `OfferCard` widget to display dynamic offers fetched from an API.

## Contributing

Feel free to fork the repository, make improvements, and submit a pull request. For major changes, please open an issue first to discuss the proposed changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.