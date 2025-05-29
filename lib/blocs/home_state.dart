import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BannerModel> banners;
  final List<CategoryModel> categories;
  final List<ProductModel> products;

  HomeLoaded(
      {required this.banners,
      required this.categories,
      required this.products});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
