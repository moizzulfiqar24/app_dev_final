import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreSeederScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void seedData() async {
    // Banners
    await firestore.collection('banners').add({
      'imageUrl': 'https://github.com/moizzulfiqar24/app_dev_final/blob/main/assets/images/banner2.png?raw=true',
    });
    await firestore.collection('banners').add({
      'imageUrl': 'https://github.com/moizzulfiqar24/app_dev_final/blob/main/assets/images/banner1.png?raw=true',
    });

    // Categories
    await firestore.collection('categories').add({
      'name': 'Earn 100%',
      'imageUrl': 'https://via.placeholder.com/100x100.png?text=Electronics',
    });
    await firestore.collection('categories').add({
      'name': 'Tax Note',
      'imageUrl': 'https://via.placeholder.com/100x100.png?text=Shoes',
    });
    await firestore.collection('categories').add({
      'name': 'Premium',
      'imageUrl': 'https://via.placeholder.com/100x100.png?text=Shoes',
    });
    await firestore.collection('categories').add({
      'name': 'Challenge',
      'imageUrl': 'https://via.placeholder.com/100x100.png?text=Shoes',
    });
    await firestore.collection('categories').add({
      'name': 'More',
      'imageUrl': 'https://via.placeholder.com/100x100.png?text=Shoes',
    });

    // Products
    await firestore.collection('products').add({
      'name': 'Wireless Headphones',
      'imageUrl': 'https://via.placeholder.com/150x150.png?text=Headphones',
      'price': 59.99,
      'isPopular': true,
    });
    await firestore.collection('products').add({
      'name': 'Running Shoes',
      'imageUrl': 'https://via.placeholder.com/150x150.png?text=Shoes',
      'price': 89.99,
      'isPopular': true,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore Seeder')),
      body: Center(
        child: ElevatedButton(
          onPressed: seedData,
          child: Text('Seed Firestore Data'),
        ),
      ),
    );
  }
}
