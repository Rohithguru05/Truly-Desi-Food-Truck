// lib/screens/favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truly_desi_app/models/menu_item.dart';
import 'package:truly_desi_app/providers/cart_provider.dart';
import 'package:truly_desi_app/providers/menu_provider.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';
import 'package:truly_desi_app/widgets/custom_app_bar.dart';
import 'package:truly_desi_app/widgets/dish_card.dart';
import 'package:truly_desi_app/widgets/truly_desi_scaffold.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final favoriteItems = menuProvider.getFavoriteMenuItems();

    return TrulyDesiScaffold(
      appBar: CustomAppBar(
        title: 'Your Favorites',
        showBackButton: false,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Theme.of(context).colorScheme.onBackground),
            onPressed: () {
              menuProvider.loadMenuItems();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Favorites refreshed!', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
                  backgroundColor: AppColors.green,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: favoriteItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: AppColors.grey.withOpacity(0.5)),
                  const SizedBox(height: 20),
                  Text(
                    'No favorite dishes yet!',
                    style: AppTextStyles.headlineSmall.copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'Tap the heart icon on menu items to add them to your favorites.',
                      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: DishCard(
                    menuItem: item,
                    onAddToCart: (quantity) {
                      cartProvider.addItem(item, quantity);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$quantity x ${item.name} added to cart!', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
                          backgroundColor: AppColors.green,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    onToggleFavorite: () {
                      menuProvider.toggleFavorite(item.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(item.isFavorite ? '${item.name} removed from favorites.' : '${item.name} added to favorites!', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
                          backgroundColor: item.isFavorite ? AppColors.red : AppColors.primary,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}