// lib/providers/app_settings_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool _isSubscribedToNotifications = false;

  bool get isDarkMode => _isDarkMode;
  bool get isSubscribedToNotifications => _isSubscribedToNotifications;

  AppSettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _isSubscribedToNotifications = prefs.getBool('isSubscribedToNotifications') ?? false;
    notifyListeners();
  }

  Future<void> toggleDarkMode(bool value) async {
    _isDarkMode = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
    notifyListeners();
  }

  Future<void> toggleNotificationSubscription(bool value) async {
    _isSubscribedToNotifications = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSubscribedToNotifications', value);
    notifyListeners();
  }
}