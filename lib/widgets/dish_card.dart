// lib/widgets/dish_card.dart
import 'package:flutter/material.dart';
import 'package:truly_desi_app/models/menu_item.dart';
import 'package:truly_desi_app/theme/app_colors.dart';
import 'package:truly_desi_app/theme/app_text_styles.dart';

class DishCard extends StatefulWidget {
  final MenuItem menuItem;
  final Function(int quantity) onAddToCart;
  final VoidCallback onToggleFavorite;

  const DishCard({
    super.key,
    required this.menuItem,
    required this.onAddToCart,
    required this.onToggleFavorite,
  });

  @override
  State<DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get current theme's text color for dynamic theming
    final Color onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4,
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Slightly reduced card padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    widget.menuItem.imageUrl,
                    width: 90, // Slightly smaller image
                    height: 90, // Slightly smaller image
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 90,
                      height: 90,
                      color: AppColors.grey.withOpacity(0.2), // Light grey placeholder
                      alignment: Alignment.center,
                      child: const Icon(Icons.image, color: AppColors.grey, size: 40), // Smaller icon
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: widget.onToggleFavorite,
                    child: Icon(
                      widget.menuItem.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: widget.menuItem.isFavorite ? AppColors.primary : AppColors.grey,
                      size: 20, // Smaller favorite icon
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12), // Slightly reduced spacing
            Expanded( // This ensures the text column takes available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.menuItem.name,
                    style: AppTextStyles.dishName.copyWith(color: onSurfaceColor, fontSize: 16), // Slightly smaller font
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4), // Reduced spacing
                  Text(
                    widget.menuItem.description,
                    style: AppTextStyles.dishDescription.copyWith(color: onSurfaceColor.withOpacity(0.7), fontSize: 12), // Slightly smaller font
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8), // Reduced spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Price text - give it flexible space
                      Flexible(
                        flex: 2, // Gives more flexibility to price
                        child: Text(
                          '\$${widget.menuItem.price.toStringAsFixed(2)}',
                          style: AppTextStyles.dishPrice.copyWith(color: AppColors.primary, fontSize: 16), // Slightly smaller font
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Quantity controls and Add button - ensure it fits
                      Expanded( // Use Expanded to make sure it fills remaining space
                        flex: 3, // Gives more flexibility to quantity/add section
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end, // Align to end
                          children: [
                            SizedBox( // Control IconButton size very precisely
                              width: 26, // Even smaller width
                              height: 26, // Even smaller height
                              child: IconButton(
                                icon: const Icon(Icons.remove_circle_outline, color: AppColors.errorRed, size: 18), // Even smaller icon
                                onPressed: _decrementQuantity,
                                padding: EdgeInsets.zero, // Remove all padding
                                constraints: const BoxConstraints(), // Remove default constraints
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0), // Even smaller horizontal padding
                              child: Text(
                                _quantity.toString(),
                                style: AppTextStyles.titleMedium.copyWith(color: onSurfaceColor, fontSize: 13), // Even smaller font
                              ),
                            ),
                            SizedBox( // Control IconButton size very precisely
                              width: 26, // Even smaller width
                              height: 26, // Even smaller height
                              child: IconButton(
                                icon: const Icon(Icons.add_circle_outline, color: AppColors.green, size: 18), // Even smaller icon
                                onPressed: _incrementQuantity,
                                padding: EdgeInsets.zero, // Remove all padding
                                constraints: const BoxConstraints(), // Remove default constraints
                              ),
                            ),
                            const SizedBox(width: 3), // Even smaller spacing before button
                            // Add button - very compact
                            SizedBox(
                              height: 28, // Fixed height for button
                              child: ElevatedButton(
                                onPressed: () => widget.onAddToCart(_quantity),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.accent,
                                  foregroundColor: AppColors.textDark, // Ensure dark text on yellow
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)), // Slightly smaller border radius
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0), // Very minimal padding
                                  textStyle: AppTextStyles.labelSmall.copyWith(fontSize: 9), // Very small text for button
                                  minimumSize: Size.zero, // Remove minimum size constraints
                                ),
                                child: const Text('Add'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}