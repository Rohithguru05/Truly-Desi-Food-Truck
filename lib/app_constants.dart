// // lib/app_constants.dart

// lib/app_constants.dart

class AppConstants {
  // App Info
  static const String appName = 'Truly Desi';
  static const String appLocation = 'New Lynn, Auckland';
  static const String appTagline = 'Authentic Indian Flavors, On Wheels!';

  // Social Media URLs
  static const String instagramUrl = 'https://www.instagram.com/trulydesinz/';
  static const String facebookUrl = 'https://www.facebook.com/trulydesinz/';
  static const String uberEatsUrl = 'https://www.ubereats.com/nz/store/truly-desi-new-lynn/wnIb4hPrR6uIjjG8YCcb2w';
  static const String orderMealNZUrl = 'https://www.ordermeal.co.nz/truly-desi-new-lynn/';
  static const String trulyDesiWebsiteUrl = 'https://trulydesi.co.nz/';

  // Contact Info (example, find real ones if available)
  static const String phoneNumber = '+64 21 123 4567'; // Placeholder
  static const String emailAddress = 'info@trulydesi.co.nz'; // Placeholder
  static const String address = '123 Food Truck Lane, New Lynn, Auckland 0600'; // Placeholder
  

  // Business Hours (from ordermeal.co.nz)
  static const String businessHours = 'Monday - Sunday: 9:00 AM - 10:00 PM';

  // Google Maps Location (approximate for New Lynn)
  static const double newLynnLatitude = -36.9030;
  static const double newLynnLongitude = 174.6853;
  static const String googleMapsQuery = 'Truly Desi Food Truck New Lynn Auckland';
  static const String googleMapsWebUrl = 'https://www.google.com/maps/search/?api=1&query=$googleMapsQuery';


  // --- ASSET PATHS (Matching all code references and your latest asset list) ---
  static const String imageDir = 'assets/images/';
  static const String lottieDir = 'assets/lottie/';

  // General Images
  static const String homeBannerBg = '${imageDir}home_banner_bg.png';
  //static const String logo = '${imageDir}logo.jpg';
  static const String logo = '${imageDir}logo_circular.png';
  static const String mapPlaceholderImage = '${imageDir}map_placeholder.png'; // Added for map placeholder
  static const String noInternet = '${imageDir}no_internet.png';
  static const String placeholderDish = '${imageDir}placeholder_dish.png';
  static const String promoBanner1 = '${imageDir}promo_banner_1.png';
  static const String promoBanner2 = '${imageDir}p1.png';
  static const String profileAvatarPlaceholder = '${imageDir}profile_avatar_placeholder.png';
  static const String splashBackground = '${imageDir}splash_background.png'; // This is the one for splash screen
  static const String trulyDesiTruck = '${imageDir}truly_desi_truck.png';
  static const String whatsappNumber = '+64211234567'; 
  static const String splashAnimationBg = '${imageDir}splash_background.png';
  static const String splashImageLogo = '${imageDir}lo.png'; 
  // Onboarding Images
  static const String onboarding1 = '${imageDir}onboarding1.jpg';
  static const String onboarding2 = '${imageDir}onboarding2.jpg';
  static const String onboarding3 = '${imageDir}onboarding3.jpg';

  // Social Media Post Images
  static const List<String> instagramPosts = [
    '${imageDir}social_insta_post1.jpg',
    '${imageDir}social_insta_post2.jpg',
    '${imageDir}social_insta_post3.jpg',
    '${imageDir}social_insta_post4.jpg',
    '${imageDir}social_insta_post5.jpg',
  ];

  // Category Images (even if not used for filtering, they are assets)
  static const String categoryChinese = '${imageDir}category_chinese.png';
  static const String categoryDesserts = '${imageDir}category_desserts.png';
  static const String categoryIndian = '${imageDir}category_indian.png';

  // Dish Images (used in MenuItem.dummyItems) - Ensure these are present as .jpg
  static const String dishAlooTikkiChaat = '${imageDir}dish_aloo_tikki_chaat.jpg';
  static const String dishButterChicken = '${imageDir}dish_butter_chicken.png';
  static const String dishChickenBiryani = '${imageDir}dish_chicken_biryani.png';
  static const String dishChickenKathiRoll = '${imageDir}dish_chicken_kathi_roll.jpg';
  static const String dishChickenTikkaMasala = '${imageDir}dish_chicken_tikka_masala.jpg';
  static const String dishCholeBhature = '${imageDir}dish_chole_bhature.jpg';
  static const String dishDalMakhani = '${imageDir}dish_dal_makhani.jpg';
  static const String dishGarlicNaan = '${imageDir}dish_garlic_naan.jpg';
  static const String dishGulabJamun = '${imageDir}dish_gulab_jamun.png';
  static const String dishJalebi = '${imageDir}dish_jalebi.png';
  static const String dishMangoLassi = '${imageDir}dish_mango_lassi.jpg';
  static const String dishMasalaDosa = '${imageDir}dish_masala_dosa.jpg';
  static const String dishMixVegCurry = '${imageDir}dish_mix_veg_curry.jpg';
  static const String dishNoodles = '${imageDir}dish_noodles.png'; // Keep as .png if that's what you have
  static const String dishPaneerButterMasala = '${imageDir}dish_paneer_butter_masala.jpg';
  static const String dishPaniPuri = '${imageDir}dish_pani_puri.jpg';
  static const String dishRajmaChawal = '${imageDir}dish_rajma_chawal.jpg';
  static const String dishSamosa = '${imageDir}dish_samosa.jpg';
  static const String dishTandooriChicken = '${imageDir}dish_tandoori_chicken.png';
  static const String dishVadaPav = '${imageDir}dish_vada_pav.png';
  static const String dishVegNoodles = '${imageDir}dish_veg_noodles.png';


  // Lottie Animations
  static const String emptyCartAnimation = '${lottieDir}empty_cart_animation.json';
  static const String errorAnimation = '${lottieDir}error_animation.json';
  static const String loadingAnimation = '${lottieDir}loading_animation.json';
  static const String orderPlacedAnimation = '${lottieDir}order_placed_animation.json';
  static const String splashLottie = '${lottieDir}splash_lottie.json';
  static const String successAnimation = '${lottieDir}success_animation.json';

  // Dummy Review Data
  static const List<Map<String, dynamic>> dummyReviews = [
    {
      'name': 'Priya Sharma',
      'rating': 5.0,
      'comment': 'Amazing experience! The Soya Chaap Tikka was so fresh, and the Chicken Noodles was a great addition!',
      'date': 'July 5, 2025',
    },
    {
      'name': 'Amit Patel',
      'rating': 4.5,
      'comment': 'One of the best Indian food trucks in Auckland! The Egg Roll was great and perfectly spiced. Excellent service!',
      'date': 'June 28, 2025',
    },
    {
      'name': 'Sarah Thompson',
      'rating': 5.0,
      'comment': 'Loved the Paneer Sandwich and Chicken Tikka. The flavors were authentic, and the ambiance was cozy. Will definitely return!',
      'date': 'June 20, 2025',
    },
    {
      'name': 'Jason Lee',
      'rating': 4.0,
      'comment': 'Decent food, but the wait time was longer than expected. The Biryani was flavorful, though, so it was worth it.',
      'date': 'June 15, 2025',
    },
    {
      'name': 'Rajesh Kumar',
      'rating': 5.0,
      'comment': 'Truly authentic taste of India! Their Butter Chicken is a must-try. So delicious!',
      'date': 'May 10, 2025',
    },
  ];
}
// class AppConstants {
//   // App Info
//   static const String appName = 'Truly Desi';
//   static const String appLocation = 'New Lynn, Auckland';
//   static const String appTagline = 'Authentic Indian Flavors, On Wheels!';

//   // Social Media URLs
//   static const String instagramUrl = 'https://www.instagram.com/trulydesinz/';
//   static const String facebookUrl = 'https://www.facebook.com/trulydesinz/';
//   static const String uberEatsUrl = 'https://www.ubereats.com/nz/store/truly-desi-new-lynn/wnIb4hPrR6uIjjG8YCcb2w';
//   static const String orderMealNZUrl = 'https://www.ordermeal.co.nz/truly-desi-new-lynn/';
//   static const String trulyDesiWebsiteUrl = 'https://trulydesi.co.nz/';

//   // Contact Info (example, find real ones if available)
//   static const String phoneNumber = '+64 21 123 4567'; // Placeholder
//   static const String emailAddress = 'info@trulydesi.co.nz'; // Placeholder
//   static const String address = '123 Food Truck Lane, New Lynn, Auckland 0600'; // Placeholder

//   // Business Hours (from ordermeal.co.nz)
//   static const String businessHours = 'Monday - Sunday: 9:00 AM - 10:00 PM';

//   // Google Maps Location (approximate for New Lynn)
//   static const double newLynnLatitude = -36.9030;
//   static const double newLynnLongitude = 174.6853;
//   static const String googleMapsQuery = 'Truly Desi Food Truck New Lynn Auckland';
//   static const String googleMapsWebUrl = 'https://www.google.com/maps/search/?api=1&query=$googleMapsQuery';


//   // --- ASSET PATHS (Matching all code references and your latest asset list) ---
//   static const String imageDir = 'assets/images/';
//   static const String lottieDir = 'assets/lottie/';

//   // General Images
//   static const String homeBannerBg = '${imageDir}home_banner_bg.png';
//   static const String logo = '${imageDir}logo.jpg';
//   static const String mapPlaceholderImage = '${imageDir}map_placeholder.png';
//   static const String noInternet = '${imageDir}no_internet.png';
//   static const String placeholderDish = '${imageDir}placeholder_dish.png';
//   static const String promoBanner1 = '${imageDir}promo_banner_1.png';
//   static const String profileAvatarPlaceholder = '${imageDir}profile_avatar_placeholder.png';
//   static const String splashBackground = '${imageDir}splash_background.png';
//   static const String trulyDesiTruck = '${imageDir}truly_desi_truck.png';

//   // Onboarding Images
//   static const String onboarding1 = '${imageDir}onboarding1.jpg';
//   static const String onboarding2 = '${imageDir}onboarding2.jpg';
//   static const String onboarding3 = '${imageDir}onboarding3.jpg';

//   // Social Media Post Images
//   static const List<String> instagramPosts = [
//     '${imageDir}social_insta_post1.jpg',
//     '${imageDir}social_insta_post2.jpg',
//     '${imageDir}social_insta_post3.jpg',
//     '${imageDir}social_insta_post4.jpg',
//     '${imageDir}social_insta_post5.jpg',
//   ];

//   // Category Images
//   static const String categoryChinese = '${imageDir}category_chinese.png';
//   static const String categoryDesserts = '${imageDir}category_desserts.png';
//   static const String categoryIndian = '${imageDir}category_indian.png';

//   // Dish Images (used in MenuItem.dummyItems)
//   static const String dishAlooTikkiChaat = '${imageDir}dish_aloo_tikki_chaat.jpg';
//   static const String dishButterChicken = '${imageDir}dish_butter_chicken.png';
//   static const String dishChickenBiryani = '${imageDir}dish_chicken_biryani.png';
//   static const String dishChickenKathiRoll = '${imageDir}dish_chicken_kathi_roll.jpg';
//   static const String dishChickenTikkaMasala = '${imageDir}dish_chicken_tikka_masala.jpg';
//   static const String dishCholeBhature = '${imageDir}dish_chole_bhature.jpg';
//   static const String dishDalMakhani = '${imageDir}dish_dal_makhani.jpg';
//   static const String dishGarlicNaan = '${imageDir}dish_garlic_naan.jpg';
//   static const String dishGulabJamun = '${imageDir}dish_gulab_jamun.png';
//   static const String dishJalebi = '${imageDir}dish_jalebi.png';
//   static const String dishMangoLassi = '${imageDir}dish_mango_lassi.jpg';
//   static const String dishMasalaDosa = '${imageDir}dish_masala_dosa.jpg';
//   static const String dishMixVegCurry = '${imageDir}dish_mix_veg_curry.jpg';
//   static const String dishNoodles = '${imageDir}dish_noodles.png'; // Keeping this if it's a general noodle image
//   static const String dishPaneerButterMasala = '${imageDir}dish_paneer_butter_masala.jpg';
//   static const String dishPaniPuri = '${imageDir}dish_pani_puri.png';
//   static const String dishRajmaChawal = '${imageDir}dish_rajma_chawal.jpg';
//   static const String dishSamosa = '${imageDir}dish_samosa.jpg';
//   static const String dishTandooriChicken = '${imageDir}dish_tandoori_chicken.png';
//   static const String dishVadaPav = '${imageDir}dish_vada_pav.png';
//   static const String dishVegNoodles = '${imageDir}dish_veg_noodles.png';


//   // Lottie Animations
//   static const String emptyCartAnimation = '${lottieDir}empty_cart_animation.json';
//   static const String errorAnimation = '${lottieDir}error_animation.json';
//   static const String loadingAnimation = '${lottieDir}loading_animation.json';
//   static const String orderPlacedAnimation = '${lottieDir}order_placed_animation.json';
//   static const String splashLottie = '${lottieDir}splash_lottie.json';
//   static const String successAnimation = '${lottieDir}success_animation.json';

//   // Dummy Review Data
//   static const List<Map<String, dynamic>> dummyReviews = [
//     {
//       'name': 'Priya Sharma',
//       'rating': 5.0,
//       'comment': 'Amazing experience! The Soya Chaap Tikka was so fresh, and the Chicken Noodles was a great addition!',
//       'date': 'July 5, 2025',
//     },
//     {
//       'name': 'Amit Patel',
//       'rating': 4.5,
//       'comment': 'One of the best Indian food trucks in Auckland! The Egg Roll was great and perfectly spiced. Excellent service!',
//       'date': 'June 28, 2025',
//     },
//     {
//       'name': 'Sarah Thompson',
//       'rating': 5.0,
//       'comment': 'Loved the Paneer Sandwich and Chicken Tikka. The flavors were authentic, and the ambiance was cozy. Will definitely return!',
//       'date': 'June 20, 2025',
//     },
//     {
//       'name': 'Jason Lee',
//       'rating': 4.0,
//       'comment': 'Decent food, but the wait time was longer than expected. The Biryani was flavorful, though, so it was worth it.',
//       'date': 'June 15, 2025',
//     },
//     {
//       'name': 'Rajesh Kumar',
//       'rating': 5.0,
//       'comment': 'Truly authentic taste of India! Their Butter Chicken is a must-try. So delicious!',
//       'date': 'May 10, 2025',
//     },
//   ];
// }

