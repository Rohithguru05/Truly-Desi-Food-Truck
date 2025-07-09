// lib/screens/order_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/models/cart_item.dart';
import 'package:truly_desi_app/providers/cart_provider.dart';
import 'package:truly_desi_app/services/url_launcher_service.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';
import 'package:truly_desi_app/widgets/custom_app_bar.dart';
import 'package:truly_desi_app/widgets/truly_desi_button.dart';
import 'package:truly_desi_app/widgets/truly_desi_scaffold.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  void _showSimulatedCheckoutDialog(BuildContext context, CartProvider cartProvider) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text('Simulated Checkout', style: AppTextStyles.titleLarge.copyWith(color: Theme.of(context).colorScheme.onSurface)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Items: ${cartProvider.totalQuantity}', style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
              Text('Total Amount: \$${cartProvider.totalAmount.toStringAsFixed(2)}', style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface)),
              const SizedBox(height: 15),
              Text('This is a simulated checkout. No real order will be placed.', style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text('Cancel', style: AppTextStyles.labelLarge.copyWith(color: AppColors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                cartProvider.clearCart();
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Order simulated and cart cleared!', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
                    backgroundColor: AppColors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textLight,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Confirm Order', style: AppTextStyles.labelLarge),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return TrulyDesiScaffold(
      appBar: CustomAppBar(
        title: 'Your Cart & Order',
        showBackButton: false,
        actions: [
          if (cartProvider.totalQuantity > 0)
            IconButton(
              icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.onBackground),
              onPressed: () {
                cartProvider.clearCart();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Cart cleared!', style: AppTextStyles.labelMedium.copyWith(color: AppColors.textLight)),
                    backgroundColor: AppColors.red,
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: cartProvider.items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined, size: 80, color: AppColors.grey.withOpacity(0.5)),
                        const SizedBox(height: 20),
                        Text(
                          'Your cart is empty!',
                          style: AppTextStyles.headlineSmall.copyWith(color: AppColors.grey),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            'Add some delicious dishes from the menu to get started.',
                            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final CartItem item = cartProvider.items[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  item.menuItem.imageUrl, // Accessing menuItem directly
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    width: 60,
                                    height: 60,
                                    color: AppColors.lightGrey,
                                    alignment: Alignment.center,
                                    child: const Icon(Icons.image, color: AppColors.grey, size: 30),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.menuItem.name, // Accessing menuItem directly
                                      style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '\$${item.menuItem.price.toStringAsFixed(2)} per item', // Accessing menuItem directly
                                      style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline, color: AppColors.red),
                                    onPressed: () {
                                      cartProvider.removeItem(item.menuItem.id);
                                    },
                                  ),
                                  Text(
                                    item.quantity.toString(),
                                    style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onSurface),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline, color: AppColors.green),
                                    onPressed: () {
                                      cartProvider.addItem(item.menuItem, 1); // Corrected addItem call
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Items:', style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onBackground)),
                    Text(cartProvider.totalQuantity.toString(), style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onBackground)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Amount:', style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground)),
                    Text('\$${cartProvider.totalAmount.toStringAsFixed(2)}', style: AppTextStyles.headlineSmall.copyWith(color: Theme.of(context).colorScheme.onBackground)),
                  ],
                ),
                const SizedBox(height: 20),
                TrulyDesiButton(
                  text: 'Simulate Checkout',
                  onPressed: cartProvider.totalQuantity > 0
                      ? () => _showSimulatedCheckoutDialog(context, cartProvider)
                      : null,
                  backgroundColor: cartProvider.totalQuantity > 0 ? AppColors.primary : AppColors.grey,
                  textColor: AppColors.textLight,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  borderRadius: 12,
                ),
                const SizedBox(height: 20),
                Text(
                  'Or Order via Our Partners:',
                  style: AppTextStyles.titleMedium.copyWith(color: Theme.of(context).colorScheme.onBackground),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TrulyDesiButton(
                        text: 'Uber Eats',
                        onPressed: () => UrlLauncherService.launchWebUrl(AppConstants.uberEatsUrl),
                        icon: Image.asset('assets/icons/ubereats_logo.png', height: 24),
                        backgroundColor: AppColors.green,
                        textColor: AppColors.textLight,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        borderRadius: 10,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TrulyDesiButton(
                        text: 'OrderMeal NZ',
                        onPressed: () => UrlLauncherService.launchWebUrl(AppConstants.orderMealNZUrl),
                        icon: Image.asset('assets/icons/ordermeal_logo.png', height: 24),
                        backgroundColor: AppColors.blue,
                        textColor: AppColors.textLight,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        borderRadius: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TrulyDesiButton(
                  text: 'Order Directly via App (Coming Soon!)',
                  onPressed: null, // This is now allowed because onPressed is nullable
                  backgroundColor: AppColors.grey,
                  textColor: AppColors.textLight,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  borderRadius: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}