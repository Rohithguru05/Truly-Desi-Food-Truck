// lib/screens/social_media_screen.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs; // ALIAS: Import carousel_slider with 'cs' alias
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/services/url_launcher_service.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';
import 'package:truly_desi_app/widgets/custom_app_bar.dart';
import 'package:truly_desi_app/widgets/truly_desi_button.dart';
import 'package:truly_desi_app/widgets/truly_desi_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrulyDesiScaffold(
      appBar: const CustomAppBar(
        title: 'Connect With Us',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Instagram Feed',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            cs.CarouselSlider( // Use aliased CarouselSlider
              options: cs.CarouselOptions( // Use aliased CarouselOptions
                height: 250.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: AppConstants.instagramPosts.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: AppColors.lightGrey,
                            alignment: Alignment.center,
                            child: Icon(Icons.image, color: AppColors.grey.withOpacity(0.5)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Center(
              child: TrulyDesiButton(
                text: 'Follow on Instagram',
                onPressed: () => UrlLauncherService.launchWebUrl(AppConstants.instagramUrl),
                icon: const Icon(FontAwesomeIcons.instagram, color: AppColors.textLight),
                backgroundColor: AppColors.primary,
                textColor: AppColors.textLight,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                borderRadius: 10,
              ),
            ),
            const SizedBox(height: 30),

            Text(
              'Our Facebook Page',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 4,
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.facebook, color: AppColors.blue),
                      title: Text('Like our Page', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () => UrlLauncherService.launchWebUrl(AppConstants.facebookUrl),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.facebookMessenger, color: AppColors.blue),
                      title: Text('Message Us', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () => UrlLauncherService.launchWebUrl('${AppConstants.facebookUrl}messages/'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            Text(
              'Order Online',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 4,
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: SizedBox( // Wrapped with SizedBox for explicit size
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/icons/ubereats_logo.png', width: 30, height: 30),
                      ),
                      title: Text('Order on Uber Eats', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.launch, size: 18, color: AppColors.grey),
                      onTap: () => UrlLauncherService.launchWebUrl(AppConstants.uberEatsUrl),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: SizedBox( // Wrapped with SizedBox for explicit size
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/icons/ordermeal_logo.png', width: 30, height: 30),
                      ),
                      title: Text('Order on OrderMeal NZ', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.launch, size: 18, color: AppColors.grey),
                      onTap: () => UrlLauncherService.launchWebUrl(AppConstants.orderMealNZUrl),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
