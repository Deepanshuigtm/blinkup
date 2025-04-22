class ProductItem {
  final String name;
  final String description;
  final double price;
  final double rating;
  final int quantityMl; // Changed to match JSON
  final String itemImageUrl; // Changed to match JSON
  final String category;

  ProductItem({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.quantityMl,
    required this.itemImageUrl,
    required this.category,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json, String category) {
    return ProductItem(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      quantityMl: json['quantity_ml'] ?? 0,
      itemImageUrl: json['item_image_url'] ?? '',
      category: category, // Use the passed category
    );
  }
}