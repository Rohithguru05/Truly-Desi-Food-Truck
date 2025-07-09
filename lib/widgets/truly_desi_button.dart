// lib/widgets/truly_desi_button.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';

class TrulyDesiButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Make it nullable
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const TrulyDesiButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.textLight,
    this.icon,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // This is fine if onPressed is nullable
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        elevation: 3,
        shadowColor: AppColors.shadowColor.withOpacity(0.3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: AppTextStyles.labelLarge.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}