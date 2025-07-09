// // lib/widgets/category_selector.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:truly_desi_app/providers/menu_provider.dart'; // Ensure MenuProvider is defined
// import 'package:truly_desi_app/theme/app_colors.dart';
// import 'package:truly_desi_app/theme/app_text_styles.dart';
// import 'package:truly_desi_app/app_constants.dart'; // Import AppConstants

// class CategorySelector extends StatelessWidget {
//   const CategorySelector({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final menuProvider = Provider.of<MenuProvider>(context);

//     // This list would ideally come from your MenuProvider or a static list of categories
//     // and use AppConstants for image paths
//     final List<Map<String, String>> categories = [
//       {'name': 'All', 'image': ''}, // No specific image for 'All'
//       {'name': 'Indian', 'image': AppConstants.categoryIndian},
//       {'name': 'Chinese', 'image': AppConstants.categoryChinese},
//       {'name': 'Desserts', 'image': AppConstants.categoryDesserts},
//       // Add more categories as needed, ensuring images exist in assets/images
//     ];

//     return Container(
//       height: 90, // Height for the horizontal category list
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           final category = categories[index];
//           final isSelected = category['name'] == menuProvider.selectedCategory;
//           return GestureDetector(
//             onTap: () {
//               menuProvider.setCategory(category['name']!);
//             },
//             child: Container(
//               margin: EdgeInsets.only(left: index == 0 ? 0.0 : 8.0), // No left margin for first item
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               decoration: BoxDecoration(
//                 color: isSelected ? AppColors.primary : AppColors.cardBackground,
//                 borderRadius: BorderRadius.circular(25.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.shadowColor.withOpacity(0.1),
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   if (category['image']!.isNotEmpty)
//                     Image.asset(
//                       category['image']!,
//                       width: 40,
//                       height: 40,
//                       color: isSelected ? AppColors.textLight : AppColors.primary,
//                       errorBuilder: (context, error, stackTrace) =>
//                           Icon(Icons.category, color: isSelected ? AppColors.textLight : AppColors.primary, size: 40),
//                     )
//                   else
//                     Icon(
//                       Icons.restaurant_menu, // Generic icon for 'All'
//                       color: isSelected ? AppColors.textLight : AppColors.primary,
//                       size: 40,
//                     ),
//                   const SizedBox(height: 4),
//                   Text(
//                     category['name']!,
//                     style: AppTextStyles.labelMedium.copyWith(
//                       color: isSelected ? AppColors.textLight : AppColors.textDark,
//                       fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }