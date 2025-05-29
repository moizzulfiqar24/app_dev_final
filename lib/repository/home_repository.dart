import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class HomeRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<List<BannerModel>> getBanners() async {
    final snapshot = await _firestore.collection('banners').get();
    return snapshot.docs
        .map((doc) => BannerModel.fromFirestore(doc.data()))
        .toList();
  }

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromFirestore(doc.data()))
        .toList();
  }

  Future<List<ProductModel>> getPopularProducts() async {
    final snapshot = await _firestore
        .collection('products')
        .where('isPopular', isEqualTo: true)
        .get();
    return snapshot.docs
        .map((doc) => ProductModel.fromFirestore(doc.data()))
        .toList();
  }
}
