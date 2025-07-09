// lib/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/app_routes.dart';
import 'package:truly_desi_app/screens/main_screen.dart'; // Import MainScreen
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';
import 'package:truly_desi_app/widgets/truly_desi_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight, // Use a light background for onboarding
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                _buildOnboardingPage(
                  image: AppConstants.onboarding1,
                  title: 'Welcome to Truly Desi!',
                  description: 'Experience the authentic flavors of India, right here in Auckland.',
                ),
                _buildOnboardingPage(
                  image: AppConstants.onboarding2,
                  title: 'Order Your Favorites',
                  description: 'Browse our extensive menu and get delicious Indian food delivered to your door.',
                ),
                _buildOnboardingPage(
                  image: AppConstants.onboarding3,
                  title: 'Stay Connected',
                  description: 'Follow us on social media for daily specials and updates.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index ? AppColors.primary : AppColors.grey.withOpacity(0.5),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                TrulyDesiButton(
                  text: _currentPage == 2 ? 'Get Started' : 'Next',
                  onPressed: () {
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      // Navigate to MainScreen using pushReplacement to clear onboarding from stack
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen(key: mainScreenKey)),
                      );
                    }
                  },
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.textLight,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  borderRadius: 12,
                ),
                if (_currentPage < 2)
                  TextButton(
                    onPressed: () {
                      // Navigate to MainScreen directly, skipping onboarding
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen(key: mainScreenKey)),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: AppTextStyles.labelLarge.copyWith(color: AppColors.grey),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) => Container(
              color: AppColors.lightGrey,
              alignment: Alignment.center,
              child: const Icon(Icons.image, size: 100, color: AppColors.grey),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.headlineMedium.copyWith(color: AppColors.textDark),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Text(
                  description,
                  style: AppTextStyles.bodyLarge.copyWith(color: AppColors.darkGrey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
