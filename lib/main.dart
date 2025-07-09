// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truly_desi_app/app_routes.dart';
import 'package:truly_desi_app/providers/cart_provider.dart';
import 'package:truly_desi_app/providers/menu_provider.dart';
import 'package:truly_desi_app/providers/theme_provider.dart';
import 'package:truly_desi_app/screens/main_screen.dart'; // Import MainScreen
import 'package:truly_desi_app/screens/onboarding_screen.dart'; // Import OnboardingScreen
import 'package:truly_desi_app/screens/splash_screen.dart'; // Import SplashScreen
import 'package:truly_desi_app/theme/app_theme.dart';
import 'package:truly_desi_app/screens/about_location_screen.dart';
import 'package:truly_desi_app/screens/promotions_screen.dart';
import 'package:truly_desi_app/screens/review_submission_screen.dart';
import 'package:truly_desi_app/screens/social_media_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Truly Desi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      // Use onGenerateRoute to control the initial flow and ensure MainScreen gets the GlobalKey
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.splashScreen:
            return MaterialPageRoute(builder: (context) => const SplashScreen());
          case AppRoutes.onboardingScreen:
            return MaterialPageRoute(builder: (context) => const OnboardingScreen());
          case AppRoutes.mainScreen:
            // This is the crucial part: MainScreen is built with the global key
            return MaterialPageRoute(builder: (context) => MainScreen(key: mainScreenKey));
          default:
            // For all other named routes, use the predefined routes map
            // Ensure these routes don't try to push MainScreen again, but rather other specific screens
            return MaterialPageRoute(builder: AppRoutes.routes[settings.name]!);
        }
      },
      // Initial route starts the flow.
      initialRoute: AppRoutes.splashScreen,
      // The `routes` map will only contain routes *other than* mainScreen
      // because mainScreen is now handled by onGenerateRoute to ensure keying.
      routes: {
        // We'll filter out mainScreen from AppRoutes.routes in AppRoutes.dart
        // to prevent duplication and ensure onGenerateRoute is the single source for MainScreen.
        // For now, keep it simple and just rely on onGenerateRoute for mainScreen.
        // Other routes like aboutLocationScreen, promotionsScreen, reviewSubmissionScreen
        // should still be in AppRoutes.routes.
        AppRoutes.aboutLocationScreen: (context) => const AboutLocationScreen(),
        AppRoutes.promotionsScreen: (context) => const PromotionsScreen(),
        AppRoutes.reviewSubmissionScreen: (context) => const ReviewSubmissionScreen(),
        // SocialMediaScreen is also a main tab, but can be navigated to directly for now.
        // If it causes issues, we can make it part of the mainScreen tabs only.
        AppRoutes.socialMediaScreen: (context) => const SocialMediaScreen(),
      },
    );
  }
}