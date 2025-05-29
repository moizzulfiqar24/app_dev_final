import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home_bloc.dart';
import '../blocs/home_event.dart';
import '../blocs/home_state.dart';
import '../repository/home_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HomeBloc(repository: HomeRepository())..add(LoadHomeData()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded) {
                return ListView(
                  children: [
                    // Banner slider
                    CarouselSlider(
                      options: CarouselOptions(height: 180.0, autoPlay: true),
                      items: state.banners.map((banner) {
                        return Builder(
                          builder: (context) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(banner.imageUrl,
                                fit: BoxFit.cover),
                          ),
                        );
                      }).toList(),
                    ),

                    // Category list
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      child: Text('Categories',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final category = state.categories[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(category.imageUrl),
                                ),
                                SizedBox(height: 4),
                                Text(category.name),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // Popular products
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Most Popular',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('See all', style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                    Container(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    product.imageUrl,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(product.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                Text('\$${product.price.toStringAsFixed(2)}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Icon(Icons.favorite_border),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              } else if (state is HomeError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
