// lib/providers/cart_provider.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/models/cart_item.dart';
import 'package:truly_desi_app/models/menu_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount => _items.fold(0.0, (sum, item) => sum + (item.menuItem.price * item.quantity));

  void addItem(MenuItem menuItem, int quantity) {
    final existingIndex = _items.indexWhere((item) => item.menuItem.id == menuItem.id);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += quantity;
    } else {
      _items.add(CartItem(menuItem: menuItem, quantity: quantity));
    }
    notifyListeners();
  }

  void removeItem(String menuItemId) {
    final existingIndex = _items.indexWhere((item) => item.menuItem.id == menuItemId);

    if (existingIndex >= 0) {
      if (_items[existingIndex].quantity > 1) {
        _items[existingIndex].quantity--;
      } else {
        _items.removeAt(existingIndex);
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}