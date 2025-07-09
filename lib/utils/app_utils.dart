import 'package:flutter/material.dart';

class AppUtils {
  // Example utility: show a themed snackbar
  static void showSnackBar(BuildContext context, String message, {Color? backgroundColor, Color? textColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor ?? Colors.white),
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // You can add more utility methods here, for example:
  // static String formatCurrency(double amount) {
  //   // Implement currency formatting logic
  //   return '\$${amount.toStringAsFixed(2)}';
  // }

  // static Future<bool> checkInternetConnectivity() async {
  //   // Implement internet connectivity check
  //   return true; // Placeholder
  // }
}