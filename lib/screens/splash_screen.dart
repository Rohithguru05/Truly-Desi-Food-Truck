// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/app_routes.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Display loading animation for 3 seconds
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  AppConstants.loadingAnimation,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  repeat: true,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppConstants.logo, height: 150),
                ),
                const SizedBox(height: 20),
                Text(
                  'Truly Desi',
                  style: AppTextStyles.displaySmall.copyWith(color: AppColors.textLight),
                ),
                Text(
                  AppConstants.appTagline,
                  style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textLight.withOpacity(0.8)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}