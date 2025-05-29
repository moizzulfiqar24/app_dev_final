class CategoryModel {
  final String name;
  final String imageUrl;

  CategoryModel({required this.name, required this.imageUrl});

  factory CategoryModel.fromFirestore(Map<String, dynamic> data) {
    return CategoryModel(
      name: data['name'],
      imageUrl: data['imageUrl'],
    );
  }
}
