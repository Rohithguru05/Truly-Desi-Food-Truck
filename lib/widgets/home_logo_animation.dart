// lib/widgets/home_logo_animation.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/theme/app_colors.dart';

class HomeLogoAnimation extends StatefulWidget {
  const HomeLogoAnimation({super.key});

  @override
  State<HomeLogoAnimation> createState() => _HomeLogoAnimationState();
}

class _HomeLogoAnimationState extends State<HomeLogoAnimation> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  late AnimationController _logoAnimationController;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<Offset> _logoSlideAnimation;

  @override
  void initState() {
    super.initState();

    // Controller for the empty circle rotation
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Rotate for 2 seconds
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );

    // Controller for the logo drop, scale, and fade
    _logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // Longer duration for drop/fade
    );
    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoAnimationController, curve: Curves.easeIn),
    );
    _logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _logoAnimationController, curve: Curves.elasticOut), // Elastic bounce effect
    );
    _logoSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -2.0), // Start from above
      end: Offset.zero, // End at original position
    ).animate(
      CurvedAnimation(parent: _logoAnimationController, curve: Curves.easeOutBack), // Smooth drop
    );

    _startAnimationSequence();
  }

  void _startAnimationSequence() async {
    // 1. Start empty circle rotation
    _rotationController.repeat(); // Keep rotating initially

    // 2. After a short delay, start logo drop/fade
    await Future.delayed(const Duration(milliseconds: 1000)); // Wait 1 second before logo animation
    if (!mounted) return;
    _logoAnimationController.forward();

    // 3. After logo animation completes, stop the rotation
    _logoAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rotationController.stop(); // Stop rotation once logo is fully visible
      }
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _logoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Empty Circular Rotating Element
          RotationTransition(
            turns: _rotationAnimation,
            child: Container(
              width: 180, // Slightly smaller than logo for effect
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.accent.withOpacity(0.7), width: 4),
              ),
            ),
          ),
          // Actual Logo falls, scales, and fades in on top
          FadeTransition(
            opacity: _logoFadeAnimation,
            child: SlideTransition(
              position: _logoSlideAnimation,
              child: ScaleTransition(
                scale: _logoScaleAnimation,
                child: ClipOval( // FIXED: Ensure the image is clipped to a perfect circle
                  child: Image.asset(
                    AppConstants.logo, // Your 'logo_circular.png'
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain, // Use contain to fit the entire image within the circle
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(AppConstants.logo, height: 150), // Fallback
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}