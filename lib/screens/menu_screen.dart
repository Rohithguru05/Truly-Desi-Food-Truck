// lib/screens/menu_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/models/menu_item.dart';
import 'package:truly_desi_app/providers/cart_provider.dart';
import 'package:truly_desi_app/providers/menu_provider.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';
import 'package:truly_desi_app/widgets/custom_app_bar.dart';
import 'package:truly_desi_app/widgets/dish_card.dart';
import 'package:truly_desi_app/widgets/truly_desi_scaffold.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    List<MenuItem> filteredItems = menuProvider.menuItems.where((item) {
      return item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             item.description.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return TrulyDesiScaffold(
      appBar: CustomAppBar(
        title: 'Our Delicious Menu',
        showBackButton: false,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Theme.of(context).colorScheme.onBackground),
            onPressed: () {
              menuProvider.loadMenuItems();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Menu refreshed!', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
                  backgroundColor: AppColors.green,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search dishes...',
                hintText: 'e.g., Biryani, Dosa',
                prefixIcon: const Icon(Icons.search, color: AppColors.grey),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: AppColors.grey),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                labelStyle: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: AppColors.primary, width: 2),
                ),
                filled: true,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 80, color: AppColors.grey.withOpacity(0.5)),
                        const SizedBox(height: 20),
                        Text(
                          'No dishes found matching your search.',
                          style: AppTextStyles.headlineSmall.copyWith(color: AppColors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      menuProvider.loadMenuItems();
                      _searchController.clear();
                      await Future.delayed(const Duration(milliseconds: 500));
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
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
                  ),
          ),
        ],
      ),
    );
  }
}
