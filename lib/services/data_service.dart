// lib/services/data_service.dart
import 'package:truly_desi_app/models/menu_item.dart';
import 'package:truly_desi_app/models/review.dart';
import 'package:truly_desi_app/models/offer.dart';

class DataService {
  // Singleton pattern for DataService
  static final DataService _instance = DataService._internal();

  factory DataService() {
    return _instance;
  }

  DataService._internal();

  // --- Menu Items Data ---
  final List<MenuItem> _menuItems = [
    MenuItem(
      id: 'd1',
      name: 'Butter Chicken',
      description: 'Creamy tomato-based curry with tender chicken pieces.',
      price: 18.50,
      imageUrl: 'assets/images/dish_butter_chicken.png', // Corrected path
      category: 'Main Course',
      isFavorite: false,
      isVegetarian: false,
    ),
    MenuItem(
      id: 'd2',
      name: 'Paneer Butter Masala',
      description: 'Cubes of soft paneer in a rich and creamy tomato gravy.',
      price: 17.00,
      imageUrl: 'assets/images/dish_paneer_butter_masala.jpg',
      category: 'Main Course',
      isFavorite: false,
      isVegetarian: true,
    ),
    MenuItem(
      id: 'd3',
      name: 'Chicken Biryani',
      description: 'Fragrant basmati rice cooked with marinated chicken and spices.',
      price: 19.50,
      imageUrl: 'assets/images/dish_chicken_biryani.png', // Corrected path
      category: 'Rice & Biryani',
      isFavorite: false,
      isVegetarian: false,
    ),
    MenuItem(
      id: 'd4',
      name: 'Vegetable Biryani',
      description: 'Aromatic basmati rice cooked with mixed vegetables and spices.',
      price: 16.50,
      imageUrl: 'assets/images/dish_mix_veg_curry.jpg',
      category: 'Rice & Biryani',
      isFavorite: false,
      isVegetarian: true,
    ),
    MenuItem(
      id: 'd5',
      name: 'Garlic Naan',
      description: 'Soft leavened bread flavored with garlic and butter.',
      price: 4.00,
      imageUrl: 'assets/images/dish_garlic_naan.jpg',
      category: 'Breads',
      isFavorite: false,
      isVegetarian: true,
    ),
    MenuItem(
      id: 'd6',
      name: 'Samosa (2 pcs)',
      description: 'Crispy pastry filled with spiced potatoes and peas.',
      price: 7.50,
      imageUrl: 'assets/images/dish_samosa.jpg',
      category: 'Appetizers',
      isFavorite: true,
      isVegetarian: true,
    ),
    MenuItem(
      id: 'd7',
      name: 'Mango Lassi',
      description: 'A refreshing yogurt drink with sweet mango pulp.',
      price: 6.00,
      imageUrl: 'assets/images/dish_mango_lassi.jpg',
      category: 'Beverages',
      isFavorite: false,
      isVegetarian: true,
    ),
    MenuItem(
      id: 'd8',
      name: 'Gulab Jamun (3 pcs)',
      description: 'Deep-fried milk solids dumplings soaked in rose-flavored syrup.',
      price: 8.00,
      imageUrl: 'assets/images/dish_gulab_jamun.png', // Corrected path
      category: 'Desserts',
      isFavorite: false,
      isVegetarian: true,
    ),
    MenuItem(
      id: 'd9',
      name: 'Aloo Gobi',
      description: 'Potatoes and cauliflower cooked with aromatic spices.',
      price: 15.00,
      imageUrl: 'assets/images/dish_mix_veg_curry.jpg',
      category: 'Main Course',
      isFavorite: false,
      isVegetarian: true,
    ),
    MenuItem(
      id: 'd10',
      name: 'Tandoori Chicken',
      description: 'Chicken marinated in yogurt and spices, cooked in a tandoor.',
      price: 19.00,
      imageUrl: 'assets/images/dish_tandoori_chicken.png', // Corrected path
      category: 'Main Course',
      isFavorite: false,
      isVegetarian: false,
    ),
    MenuItem(
      id: 'd11',
      name: 'Chicken Noodles',
      description: 'Stir-fried noodles with chicken and vegetables.',
      price: 14.00,
      imageUrl: 'assets/images/dish_noodles.png', // Corrected path
      category: 'Noodles',
      isFavorite: false,
      isVegetarian: false,
    ),
    MenuItem(
      id: 'd12',
      name: 'Veg Noodles',
      description: 'Stir-fried noodles with mixed vegetables.',
      price: 12.00,
      imageUrl: 'assets/images/dish_veg_noodles.png', // Corrected path
      category: 'Noodles',
      isFavorite: false,
      isVegetarian: true,
    ),
    MenuItem(
      id: 'd13',
      name: 'Vada Pav',
      description: 'Spicy potato fritter sandwiched in a soft bun.',
      price: 6.00,
      imageUrl: 'assets/images/dish_vada_pav.png', // Corrected path
      category: 'Snacks',
      isFavorite: false,
      isVegetarian: true,
    ),
    MenuItem(
      id: 'd14',
      name: 'Jalebi',
      description: 'Crispy, syrupy sweet pretzel-like dessert.',
      price: 7.00,
      imageUrl: 'assets/images/dish_jalebi.png', // Corrected path
      category: 'Desserts',
      isFavorite: false,
      isVegetarian: true,
    ),
  ];

  List<MenuItem> getMenuItems() {
    return List.from(_menuItems);
  }

  void toggleMenuItemFavorite(String id) {
    final index = _menuItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      _menuItems[index] = _menuItems[index].copyWith(isFavorite: !_menuItems[index].isFavorite);
    }
  }

  // --- Reviews Data ---
  final List<Review> _reviews = [
    Review(
      name: 'Anjali Sharma',
      rating: 5.0,
      comment: 'Absolutely love the Butter Chicken! So creamy and flavorful. A must-try!',
      date: '2023-10-26',
    ),
    Review(
      name: 'David Lee',
      rating: 4.5,
      comment: 'Great Chicken Biryani, very authentic taste. Spice level was perfect.',
      date: '2023-10-20',
    ),
    Review(
      name: 'Priya Patel',
      rating: 5.0,
      comment: 'The Paneer Butter Masala is incredible! Best vegetarian option.',
      date: '2023-09-15',
    ),
    Review(
      name: 'Chris Green',
      rating: 4.0,
      comment: 'Good food, but the wait was a bit long. Worth it for the Garlic Naan!',
      date: '2023-09-01',
    ),
  ];

  List<Review> getReviews() {
    return List.from(_reviews);
  }

  void addReview(Review newReview) {
    _reviews.add(newReview);
  }

  // --- Offers Data ---
  final List<Offer> _offers = [
    Offer(
      id: 'o1',
      title: 'Weekend Family Feast!',
      description: 'Get 20% off on all orders above \$50 this weekend. Use code: FAMILY20',
      imageUrl: 'assets/images/promo_banner_1.png',
      validity: 'Valid: Fri - Sun',
    ),
    Offer(
      id: 'o2',
      title: 'Free Mango Lassi',
      description: 'Enjoy a complimentary Mango Lassi with any main course purchase.',
      imageUrl: 'assets/images/dish_mango_lassi.jpg',
      validity: 'Expires: July 31st',
    ),
    Offer(
      id: 'o3',
      title: 'Student Discount',
      description: 'Show your student ID and get 15% off your entire order!',
      imageUrl: 'assets/images/p1.png', // Using user's provided path
      validity: 'Valid: Mon - Thu',
    ),
  ];

  List<Offer> getOffers() {
    return List.from(_offers);
  }
}