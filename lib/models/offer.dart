// lib/models/offer.dart
class Offer {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String validity; // e.g., "Expires July 31st"

  Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.validity,
  });
}