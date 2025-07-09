// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/app_routes.dart';
import 'package:truly_desi_app/screens/main_screen.dart'; // Import MainScreen to access its GlobalKey
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';
import 'package:truly_desi_app/widgets/animated_icon_button.dart';
import 'package:truly_desi_app/widgets/home_logo_animation.dart';
import 'package:truly_desi_app/widgets/custom_app_bar.dart';
import 'package:truly_desi_app/widgets/truly_desi_button.dart';
import 'package:truly_desi_app/widgets/truly_desi_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrulyDesiScaffold(
      appBar: CustomAppBar(
        title: AppConstants.appName,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Theme.of(context).colorScheme.onBackground),
            onPressed: () {
              print('Attempting to navigate to Favorites tab (index 4)');
              print('mainScreenKey.currentState is: ${mainScreenKey.currentState}');
              mainScreenKey.currentState?.selectTab(4);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppConstants.homeBannerBg,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Theme.of(context).colorScheme.background);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                  Theme.of(context).colorScheme.background,
                ],
                stops: const [0.0, 0.4, 0.7, 1.0],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const HomeLogoAnimation(),
                  const SizedBox(height: 10),
                  Text(
                    AppConstants.appLocation,
                    style: AppTextStyles.headlineSmall.copyWith(color: AppColors.textLight),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppConstants.appTagline,
                    style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textLight.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedIconButton(
                        icon: Icons.restaurant_menu,
                        label: 'Our Menu',
                        onPressed: () {
                          print('Attempting to navigate to Menu tab (index 1)');
                          print('mainScreenKey.currentState is: ${mainScreenKey.currentState}');
                          mainScreenKey.currentState?.selectTab(1); // Index for Menu tab
                        },
                        iconColor: AppColors.accent,
                        labelColor: AppColors.textLight,
                      ),
                      AnimatedIconButton(
                        icon: Icons.delivery_dining,
                        label: 'Order Online',
                        onPressed: () {
                          print('Attempting to navigate to Cart tab (index 2)');
                          print('mainScreenKey.currentState is: ${mainScreenKey.currentState}');
                          mainScreenKey.currentState?.selectTab(2); // Index for Cart/Order tab
                        },
                        iconColor: AppColors.accent,
                        labelColor: AppColors.textLight,
                      ),
                      AnimatedIconButton(
                        icon: Icons.public,
                        label: 'Follow Us',
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.socialMediaScreen);
                        },
                        iconColor: AppColors.accent,
                        labelColor: AppColors.textLight,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Today\'s Specials',
                      style: AppTextStyles.headlineSmall.copyWith(color: AppColors.textLight),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.promotionsScreen);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 6,
                      color: Theme.of(context).cardColor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Image.asset(
                              AppConstants.promoBanner1,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: 180,
                                color: AppColors.lightGrey,
                                alignment: Alignment.center,
                                child: Text('Special Offer Image', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey)),
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.transparent,
                                    ],
                                    stops: const [0.0, 0.5],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 15,
                              right: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Don\'t Miss Out!',
                                    style: AppTextStyles.titleMedium.copyWith(color: AppColors.accent),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Get a FREE drink with any Main Course today!',
                                    style: AppTextStyles.headlineSmall.copyWith(color: AppColors.textLight),
                                  ),
                                  const SizedBox(height: 8),
                                  TrulyDesiButton(
                                    text: 'Tap to view all promotions',
                                    onPressed: () {
                                      Navigator.pushNamed(context, AppRoutes.promotionsScreen);
                                    },
                                    backgroundColor: AppColors.primary,
                                    textColor: AppColors.textLight,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                    borderRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Our Story & Location',
                      style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.aboutLocationScreen);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 6,
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary, size: 28),
                                const SizedBox(width: 10),
                                Text(
                                  AppConstants.appLocation,
                                  style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Bringing the authentic taste of India to Auckland. Find us in New Lynn and enjoy our fresh, flavorful dishes daily.',
                              style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Learn More >',
                                style: AppTextStyles.labelMedium.copyWith(color: Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.aboutLocationScreen);
        },
        label: Text('Locate Us', style: AppTextStyles.labelLarge.copyWith(color: AppColors.textLight)),
        icon: const Icon(Icons.location_on, color: AppColors.textLight),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}