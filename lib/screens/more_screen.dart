// lib/screens/more_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/providers/theme_provider.dart';
import 'package:truly_desi_app/services/data_service.dart';
import 'package:truly_desi_app/services/url_launcher_service.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';
import 'package:truly_desi_app/widgets/custom_app_bar.dart';
import 'package:truly_desi_app/widgets/truly_desi_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final DataService dataService = DataService();

    return TrulyDesiScaffold(
      appBar: const CustomAppBar(
        title: 'More & Settings',
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Preferences
            Text(
              'App Preferences',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 4,
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.brightness_4, color: Theme.of(context).colorScheme.primary),
                      title: Text('Dark Mode', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          themeProvider.toggleTheme();
                        },
                        activeColor: AppColors.accent,
                        inactiveThumbColor: AppColors.grey,
                        inactiveTrackColor: AppColors.lightGrey,
                      ),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.notifications, color: Theme.of(context).colorScheme.primary),
                      title: Text('Daily Notifications', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Notification settings coming soon!', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
                              backgroundColor: AppColors.blue,
                            ),
                          );
                        },
                        activeColor: AppColors.accent,
                        inactiveThumbColor: AppColors.grey,
                        inactiveTrackColor: AppColors.lightGrey,
                      ),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.language, color: Theme.of(context).colorScheme.primary),
                      title: Text('Language (English/Hindi)', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Language selection coming soon!', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
                            backgroundColor: AppColors.blue,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Support & Information
            Text(
              'Support & Information',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 4,
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.star_rate, color: Theme.of(context).colorScheme.primary),
                      title: Text('Rate Our App', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () {
                        UrlLauncherService.launchWebUrl(AppConstants.trulyDesiWebsiteUrl);
                      },
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.feedback, color: Theme.of(context).colorScheme.primary),
                      title: Text('Send Feedback', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () {
                        UrlLauncherService.launchEmail(AppConstants.emailAddress, 'Feedback from Truly Desi App', '');
                      },
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.policy, color: Theme.of(context).colorScheme.primary),
                      title: Text('Privacy Policy', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () {
                        UrlLauncherService.launchWebUrl('${AppConstants.trulyDesiWebsiteUrl}/privacy-policy');
                      },
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.info, color: Theme.of(context).colorScheme.primary),
                      title: Text('About App', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () {
                        showAboutDialog(
                          context: context,
                          applicationName: AppConstants.appName,
                          applicationVersion: '1.0.0',
                          applicationLegalese: '© 2024 Truly Desi. All rights reserved.',
                          children: [
                            Text('Developed with Flutter.', style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.onSurface)), // Ensure text color
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Social Media Links
            Text(
              'Connect with Us',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 4,
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.instagram, color: AppColors.primary),
                      title: Text('Instagram', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.launch, size: 18, color: AppColors.grey),
                      onTap: () => UrlLauncherService.launchWebUrl(AppConstants.instagramUrl),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.facebook, color: AppColors.primary),
                      title: Text('Facebook', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      trailing: const Icon(Icons.launch, size: 18, color: AppColors.grey),
                      onTap: () => UrlLauncherService.launchWebUrl(AppConstants.facebookUrl),
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