// lib/app_routes.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/screens/about_location_screen.dart';
import 'package:truly_desi_app/screens/favorites_screen.dart';
import 'package:truly_desi_app/screens/home_screen.dart';
import 'package:truly_desi_app/screens/main_screen.dart'; // Make sure MainScreen is imported
import 'package:truly_desi_app/screens/menu_screen.dart';
import 'package:truly_desi_app/screens/more_screen.dart';
import 'package:truly_desi_app/screens/onboarding_screen.dart';
import 'package:truly_desi_app/screens/order_screen.dart';
import 'package:truly_desi_app/screens/promotions_screen.dart';
import 'package:truly_desi_app/screens/review_submission_screen.dart';
import 'package:truly_desi_app/screens/social_media_screen.dart';
import 'package:truly_desi_app/screens/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String onboardingScreen = '/onboarding';
  static const String mainScreen = '/main'; // This is the screen with the BottomNavigationBar
  // Note: homeScreen, menuScreen, orderScreen, socialMediaScreen, favoritesScreen, moreScreen
  // are now primarily accessed via MainScreen's selectTab method, not direct named routes.
  // They are listed here for completeness but won't be used for direct Navigator.pushNamed.
  static const String homeScreen = '/home';
  static const String menuScreen = '/menu';
  static const String orderScreen = '/order';
  static const String socialMediaScreen = '/social_media';
  static const String favoritesScreen = '/favorites';
  static const String moreScreen = '/more';

  static const String aboutLocationScreen = '/about_location';
  static const String promotionsScreen = '/promotions';
  static const String reviewSubmissionScreen = '/review_submission';

  // Only include routes that are NOT mainScreen and its internal tabs
  // as mainScreen is now handled by onGenerateRoute in main.dart
  static Map<String, WidgetBuilder> routes = {
    // splashScreen and onboardingScreen are handled by onGenerateRoute for initial flow
    // mainScreen is handled by onGenerateRoute to ensure GlobalKey
    aboutLocationScreen: (context) => const AboutLocationScreen(),
    promotionsScreen: (context) => const PromotionsScreen(),
    reviewSubmissionScreen: (context) => const ReviewSubmissionScreen(),
    // If you need to navigate directly to these screens from outside MainScreen, keep them here.
    // Otherwise, they are typically internal to MainScreen's IndexedStack.
    // For now, keeping them as they might be used by other parts of the app for direct navigation.
    homeScreen: (context) => const HomeScreen(),
    menuScreen: (context) => const MenuScreen(),
    orderScreen: (context) => const OrderScreen(),
    socialMediaScreen: (context) => const SocialMediaScreen(),
    favoritesScreen: (context) => const FavoritesScreen(),
    moreScreen: (context) => const MoreScreen(),
  };
}