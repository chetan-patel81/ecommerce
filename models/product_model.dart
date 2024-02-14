class Product {
  final bool isFavorite;
  final String image;
  final String name;
  final int reviews;
  final String description;
  final String category;
  final double realPrice;
  final double discPrice;
 final int quantity;

  Product( {required this.quantity,
    required this.realPrice,
    required this.discPrice,
    required this.image,
    required this.isFavorite,
    required this.name,
    required this.reviews,
    required this.description,
    required this.category,
  });
}
