# Truly Desi App

## Authentic Indian Flavors, On Wheels!

![Truly Desi Splash Image](assets/images/logo_circular.png)

## Table of Contents

* [1. Project Overview](#1-project-overview)
* [2. Features](#2-features)
* [3. Detalied Documentation](#3-detailed-documentation)
* [4. Technologies Used](#4-technologies-used)
* [5. Installation](#5-installation)
* [6. Usage](#6-usage)
* [7. Project Structure](#7-project-structure)
* [8. Contributing](#8-contributing)
* [9. License](#9-license)
* [10. Contact](#10-contact)
* [11. Latest Release (APK)](#11-latest-release-apk)

---

## 1. Project Overview

The "Truly Desi" mobile application is a vibrant Flutter-based platform designed for the "Truly Desi" food truck in New Lynn, Auckland. It serves as a digital storefront and information hub, allowing users to:

* Browse a delicious menu of authentic Indian dishes.
* Manage their shopping cart and place orders (simulated).
* Discover special promotions and offers.
* Connect with the food truck on social media.
* Learn about the "Truly Desi" story and location details.
* Submit valuable customer reviews.

The app aims to enhance the customer experience by providing seamless access to information and a convenient way to engage with the "Truly Desi" brand.

---

## 2. Features

The "Truly Desi" app comes packed with the following key features and functionalities:

* **Splash Screen:** A branded introduction with the app name, tagline, and a subtle loading indicator.
* **Onboarding Experience:** A guided tour for new users highlighting the app's main functionalities with engaging visuals.
* **Intuitive Bottom Navigation:** Easy access to core sections: Home, Menu, Cart, Social, Favorites, and More.
* **Home Screen:**
    * Dynamic animated logo.
    * Quick access buttons for "Our Menu," "Order Online," and "Follow Us."
    * Promotional banners for daily specials and offers.
    * Information card for "Our Story & Location" with direct navigation.
    * Floating action button to "Locate Us."
* **Menu Screen:**
    * Comprehensive list of all available dishes with images, descriptions, and prices.
    * Search functionality to filter dishes by name or description.
    * Quantity controls for adding items to the cart.
    * "Add to Cart" functionality with instant feedback.
    * "Favorite" toggle for dishes, allowing users to save their preferred items.
    * Pull-to-refresh functionality for the menu list.
* **Order/Cart Screen:**
    * Detailed view of items added to the cart.
    * Ability to adjust quantities or remove items from the cart.
    * Displays the total quantity and total amount of the order.
    * "Clear Cart" option.
    * "Proceed to Checkout" (placeholder for future payment integration).
* **Social Media Screen:**
    * Integrated Instagram feed carousel showcasing recent posts.
    * Direct links to "Truly Desi" social media pages (Instagram, Facebook).
    * Direct links to external ordering platforms (Uber Eats, OrderMeal NZ).
* **Favorites Screen:**
    * A dedicated section to view all dishes marked as favorite.
    * Full `DishCard` functionality (add to cart, quantity, unfavorite) directly from this screen.
* **More & Settings Screen:**
    * **App Preferences:** Dark Mode toggle, placeholder for notifications and language settings.
    * **Support & Information:** Links to rate the app, send feedback, view privacy policy, and "About App" dialog.
    * **Connect with Us:** Quick links to Instagram and Facebook.
* **About Us & Location Screen:**
    * Detailed narrative of the "Truly Desi" story and mission.
    * Introduction to the chef.
    * Location details with a map placeholder and "Get Directions" button (launches Google Maps).
    * Business hours.
    * Contact information (phone, email, WhatsApp) with direct launch functionalities.
    * Gallery of "Moments & Events" (Instagram posts).
    * Customer review section displaying testimonials.
    * "Leave a Review" button to navigate to the review submission form.
* **Review Submission Screen:**
    * Form to submit a new review with name, rating (star selector), and comment.
    * Input validation and success/error feedback.
* **Responsive Design:** Optimized for various screen sizes and orientations (mobile, tablet).
* **Theming:** Supports both Light and Dark modes for enhanced user comfort.
* **Custom App Icon:** Integrated custom app launcher icon for Android and iOS.

---

## 3. Detailed Documentation

For a comprehensive breakdown of the app's features, functionalities, navigation flows, and detailed screenshots, please refer to our full documentation:

[Truly Desi App - Detailed Documentation](doc/Truly%20Desi%20App_%20Detailed%20Features,%20Functionalities,%20and%20Navigation%20Guide.pdf)

--- 

## 4. Technologies Used

* **Flutter:** The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
* **Dart:** The programming language used by Flutter.
* **`provider`:** A simple yet powerful state management solution for Flutter applications.
* **`lottie`:** For rendering engaging Lottie animations (e.g., loading, empty cart).
* **`url_launcher`:** A Flutter plugin for launching URLs (web, email, phone, SMS) from the app.
* **`font_awesome_flutter`:** For easily using Font Awesome icons in Flutter.
* **`carousel_slider`:** For creating image carousels (e.g., Instagram feed).
* **`flutter_launcher_icons`:** Used for generating platform-specific app launcher icons from a single source image.

---

## 5. Installation

To get a local copy up and running, follow these simple steps.

### Prerequisites

* [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
* An IDE (VS Code with Flutter extensions, Android Studio, etc.).
* A physical device or emulator/simulator for testing.

### Steps

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/truly_desi_app.git](https://github.com/your-username/truly_desi_app.git)
    cd truly_desi_app
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Ensure assets are correctly placed:**
    * Create `assets/images/`, `assets/lottie/`, and `assets/icons/` directories in the root of your project.
    * Place all necessary image files (`.png`, `.jpg`) into `assets/images/`.
    * Place all Lottie JSON files (`.json`) into `assets/lottie/`.
    * Place `ubereats_logo.png` and `ordermeal_logo.png` into `assets/icons/`.
    * Verify your `pubspec.yaml` includes these asset paths:
        ```yaml
        flutter:
          uses-material-design: true
          assets:
            - assets/images/
            - assets/lottie/
            - assets/icons/
        ```
4.  **Generate App Launcher Icons (if modifying or updating the icon):**
    If you change the `image_path` in `pubspec.yaml` under `flutter_launcher_icons` or need to regenerate the native app icons:
    ```bash
    flutter pub run flutter_launcher_icons
    ```
    *(Note: The generated icon files are committed to the repository, so this step is generally not required for initial setup after cloning.)*

5.  **Run `flutter clean`:**
    ```bash
    flutter clean
    ```
6.  **Get packages again (just to be safe):**
    ```bash
    flutter pub get
    ```

---

## 6. Usage

To run the app on a connected device or emulator:

```bash
flutter run

```



## 7. Project Structure

```
truly_desi_app/
├── android/                  # Android specific files
├── ios/                      # iOS specific files
├── lib/
│   ├── main.dart             # Main entry point of the application
│   ├── app_constants.dart    # Global constants (app info, asset paths, URLs)
│   ├── app_routes.dart       # Defines named routes for navigation
│   ├── models/               # Data models (e.g., MenuItem, CartItem, Offer, Review)
│   ├── providers/            # State management with Provider (e.g., CartProvider, MenuProvider, ThemeProvider)
│   ├── screens/              # Individual UI screens (e.g., HomeScreen, MenuScreen, SplashScreen)
│   ├── services/             # Business logic and external integrations (e.g., DataService, UrlLauncherService)
│   ├── theme/                # Defines app's color scheme and themes (AppColors, AppTheme, AppTextStyles)
│   └── widgets/              # Reusable UI components (e.g., DishCard, CustomAppBar, TrulyDesiButton)
├── assets/
│   ├── images/               # All image assets (PNG, JPG)
│   ├── lottie/               # Lottie animation JSON files
│   └── icons/                # Specific icon assets (e.g., UberEats logo)
├── pubspec.yaml              # Project dependencies and metadata
└── README.md                 # This file
```




## 8. Contributing


Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

Fork the Project

Create your Feature Branch (git checkout -b feature/AmazingFeature)

Commit your Changes (git commit -m 'Add some AmazingFeature')

Push to the Branch (git push origin feature/AmazingFeature)

Open a Pull Request



## 9. License
Distributed under the MIT License. See LICENSE for more information.

## 10. Contact
 Guru Rohith.G - [prasanth9705.g@gmail.com] 
Project Link: https://github.com/Rohithguru05/Truly-Desi-Food-Truck.git



## 11. Latest Release (APK)
To get a runnable Android APK of the "Truly Desi" app, you will need to build the project locally.

After successfully building the project for release, the **app-release.apk** file will be located in the following path within your project directory:

build/app/outputs/flutter-apk/app-release.apk

**Alternatively, you can download a zipped version of the APK from our GitHub Releases page. After downloading, you will need to unzip the file to access the app-release.apk and install it on an Android device.**

(A formal GitHub Release with direct APK download will be provided at a later stage.)
