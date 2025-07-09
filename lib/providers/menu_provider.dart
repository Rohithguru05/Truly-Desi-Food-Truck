// lib/providers/menu_provider.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/models/menu_item.dart';
import 'package:truly_desi_app/services/data_service.dart';

class MenuProvider with ChangeNotifier {
  List<MenuItem> _menuItems = [];
  final DataService _dataService = DataService();

  List<MenuItem> get menuItems => List.unmodifiable(_menuItems);

  MenuProvider() {
    loadMenuItems();
  }

  void loadMenuItems() {
    _menuItems = _dataService.getMenuItems();
    notifyListeners();
  }

  void toggleFavorite(String id) {
    _dataService.toggleMenuItemFavorite(id);
    loadMenuItems(); // Re-load items to reflect the change
  }

  List<MenuItem> getFavoriteMenuItems() {
    return _menuItems.where((item) => item.isFavorite).toList();
  }
}