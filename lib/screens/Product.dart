class Product {
  final String id;
  final String name;
  final String price;
  final int rating;
  final String description;
  final List<String> images;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rating, 
    required this.description,
    required this.images,
  });
}