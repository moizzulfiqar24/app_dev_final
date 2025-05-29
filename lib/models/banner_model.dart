class BannerModel {
  final String imageUrl;

  BannerModel({required this.imageUrl});

  factory BannerModel.fromFirestore(Map<String, dynamic> data) {
    return BannerModel(imageUrl: data['imageUrl']);
  }
}
