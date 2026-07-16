class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final int quantity;
  final String unit;
  final String farmerName;
  final String location;
  final String image;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.farmerName,
    required this.location,
    required this.image,
    required this.description,
  });
}