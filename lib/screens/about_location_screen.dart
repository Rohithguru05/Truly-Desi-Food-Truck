// lib/screens/about_location_screen.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/models/review.dart';
import 'package:truly_desi_app/services/data_service.dart';
import 'package:truly_desi_app/services/url_launcher_service.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';
import 'package:truly_desi_app/widgets/custom_app_bar.dart';
import 'package:truly_desi_app/widgets/review_card.dart';
import 'package:truly_desi_app/widgets/truly_desi_button.dart';
import 'package:truly_desi_app/widgets/truly_desi_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutLocationScreen extends StatelessWidget {
  const AboutLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DataService dataService = DataService();
    final List<Review> reviews = dataService.getReviews();

    return TrulyDesiScaffold(
      appBar: const CustomAppBar(
        title: 'About Us & Location',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Our Story Section
            Text(
              'Our Story',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Truly Desi Food Truck brings the authentic, vibrant flavors of India directly to you in Auckland, New Zealand. Our journey began with a passion for sharing traditional Indian recipes, crafted with fresh, locally sourced ingredients and a whole lot of love. From the bustling streets of Mumbai to the aromatic kitchens of Punjab, we aim to deliver a culinary experience that transports you straight to India.',
                      style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Every dish is a celebration of rich spices, time-honored techniques, and the warmth of Indian hospitality. We believe in serving food that not only tastes incredible but also tells a story of heritage and passion. Come find us and embark on a truly desi culinary adventure!',
                      style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Meet the Chef / Our Values
            Text(
              'Meet Our Chef',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 4,
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        AppConstants.profileAvatarPlaceholder,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 80,
                          height: 80,
                          color: AppColors.lightGrey,
                          alignment: Alignment.center,
                          child: const Icon(Icons.person, color: AppColors.grey, size: 40),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chef Rahul Singh',
                            style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'With over 20 years of experience in authentic Indian cuisine, Chef Rahul brings his passion and expertise to every dish. His secret? A blend of traditional family recipes and a dash of innovation!',
                            style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Location Section
            Text(
              'Find Us Here',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 4,
              color: Theme.of(context).cardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      AppConstants.mapPlaceholderImage,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        color: AppColors.lightGrey,
                        alignment: Alignment.center,
                        child: Text('Map Placeholder', style: AppTextStyles.bodyMedium),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.appLocation,
                          style: AppTextStyles.titleLarge.copyWith(color: Theme.of(context).colorScheme.onSurface),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          AppConstants.address,
                          style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
                        ),
                        const SizedBox(height: 15),
                        TrulyDesiButton(
                          text: 'Get Directions',
                          onPressed: () => UrlLauncherService.launchMap(
                            AppConstants.newLynnLatitude,
                            AppConstants.newLynnLongitude,
                            AppConstants.googleMapsQuery,
                          ),
                          icon: const Icon(Icons.directions, color: AppColors.textLight),
                          borderRadius: 12,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Business Hours
            Text(
              'Business Hours',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 4,
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: AppColors.accent, size: 28),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        AppConstants.businessHours,
                        style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Contact Us Section
            Text(
              'Contact Us',
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
                      leading: const Icon(Icons.phone, color: AppColors.primary),
                      title: Text('Call Us', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      subtitle: Text(AppConstants.phoneNumber, style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8))),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () => UrlLauncherService.launchPhone(AppConstants.phoneNumber.replaceAll(' ', '')),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: const Icon(Icons.email, color: AppColors.primary),
                      title: Text('Email Us', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      subtitle: Text(AppConstants.emailAddress, style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8))),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () => UrlLauncherService.launchEmail(AppConstants.emailAddress, 'Inquiry from Truly Desi App', ''),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.whatsapp, color: AppColors.green),
                      title: Text('Chat on WhatsApp', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      subtitle: Text(AppConstants.phoneNumber, style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8))),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.grey),
                      onTap: () => UrlLauncherService.launchWhatsApp(AppConstants.whatsappNumber, 'Hello Truly Desi! I have a question from your app.'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Photos from Events/Instagram
            Text(
              'Moments & Events',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: AppConstants.instagramPosts.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    AppConstants.instagramPosts[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.lightGrey,
                      alignment: Alignment.center,
                      child: Icon(Icons.image, color: AppColors.grey.withOpacity(0.5)),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),

            // Customer Reviews Section
            Text(
              'Customer Reviews',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 15),
            reviews.isEmpty
                ? Center(
                    child: Text(
                      'No reviews yet. Be the first to leave one!',
                      style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: ReviewCard(review: reviews[index]),
                      );
                    },
                  ),
            const SizedBox(height: 20),
            Center(
              child: TrulyDesiButton(
                text: 'Leave a Review',
                onPressed: () {
                  Navigator.pushNamed(context, '/review_submission');
                },
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: AppColors.textLight,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                borderRadius: 12,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
