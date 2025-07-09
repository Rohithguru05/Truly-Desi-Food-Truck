// lib/screens/review_submission_screen.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/models/review.dart';
import 'package:truly_desi_app/services/data_service.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';
import 'package:truly_desi_app/widgets/custom_app_bar.dart';
import 'package:truly_desi_app/widgets/truly_desi_button.dart';
import 'package:truly_desi_app/widgets/truly_desi_scaffold.dart';

class ReviewSubmissionScreen extends StatefulWidget {
  const ReviewSubmissionScreen({super.key});

  @override
  State<ReviewSubmissionScreen> createState() => _ReviewSubmissionScreenState();
}

class _ReviewSubmissionScreenState extends State<ReviewSubmissionScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  double _rating = 0.0;

  @override
  void dispose() {
    _nameController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _submitReview() {
    if (_nameController.text.isEmpty || _commentController.text.isEmpty || _rating == 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields and provide a rating.', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
          backgroundColor: AppColors.errorRed,
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    final newReview = Review(
      name: _nameController.text,
      rating: _rating,
      comment: _commentController.text,
      date: DateTime.now().toLocal().toString().split(' ')[0],
    );

    DataService().addReview(newReview);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Review submitted successfully!', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
        backgroundColor: AppColors.green,
        duration: const Duration(seconds: 2),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return TrulyDesiScaffold(
      appBar: const CustomAppBar(
        title: 'Submit Review',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Share Your Experience!',
              style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Your Name',
                hintText: 'e.g., John Doe',
                labelStyle: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                hintStyle: AppTextStyles.hintTextStyle.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                border: Theme.of(context).inputDecorationTheme.border,
                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                filled: true,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Rating:',
              style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: AppColors.starYellow,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _commentController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Your Comment',
                hintText: 'Tell us about your experience...',
                alignLabelWithHint: true,
                labelStyle: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                hintStyle: AppTextStyles.hintTextStyle.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                border: Theme.of(context).inputDecorationTheme.border,
                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                filled: true,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 30),
            Center(
              child: TrulyDesiButton(
                text: 'Submit Review',
                onPressed: _submitReview,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: AppColors.textLight,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                borderRadius: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
