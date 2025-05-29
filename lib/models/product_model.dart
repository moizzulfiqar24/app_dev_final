class ProductModel {
  final String name;
  final String imageUrl;
  final double price;

  ProductModel({
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory ProductModel.fromFirestore(Map<String, dynamic> data) {
    return ProductModel(
      name: data['name'],
      imageUrl: data['imageUrl'],
      price: (data['price'] as num).toDouble(),
    );
  }
}
