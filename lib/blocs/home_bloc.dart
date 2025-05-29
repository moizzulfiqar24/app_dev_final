import 'package:app_dev_final/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  void _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final banners = await repository.getBanners();
      final categories = await repository.getCategories();
      final products = await repository.getPopularProducts();
      emit(HomeLoaded(
          banners: banners, categories: categories, products: products));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
