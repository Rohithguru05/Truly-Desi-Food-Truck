// lib/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.showBackButton = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background, // Match scaffold background for seamless look
      elevation: 0, // No shadow by default
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.textDark),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: title.isEmpty
          ? Image.asset(AppConstants.logo, height: 40) // Corrected to logo.png
          : Text(
              title,
              style: AppTextStyles.titleLarge.copyWith(color: AppColors.textDark),
            ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}