class Product {
  final String name;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviews;
  final String description;
  final List<String> availableSizes;

  Product({
    required this.name,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.category,
    this.rating = 0.0,
    this.reviews = 0,
    this.description = '',
    this.availableSizes = const [],
  });
}
