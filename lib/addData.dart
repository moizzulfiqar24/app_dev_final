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
      'imageUrl': 'https://raw.githubusercontent.com/moizzulfiqar24/app_dev_final/9b608be4cd1a10484fec88c664240a7cdb5db46f/assets/images/3.png',
    });
    await firestore.collection('categories').add({
      'name': 'Tax Note',
      'imageUrl': 'https://raw.githubusercontent.com/moizzulfiqar24/app_dev_final/9b608be4cd1a10484fec88c664240a7cdb5db46f/assets/images/4.png',
    });
    await firestore.collection('categories').add({
      'name': 'Premium',
      'imageUrl': 'https://raw.githubusercontent.com/moizzulfiqar24/app_dev_final/9b608be4cd1a10484fec88c664240a7cdb5db46f/assets/images/2.png',
    });
    await firestore.collection('categories').add({
      'name': 'Challenge',
      'imageUrl': 'https://raw.githubusercontent.com/moizzulfiqar24/app_dev_final/9b608be4cd1a10484fec88c664240a7cdb5db46f/assets/images/5.png',
    });
    await firestore.collection('categories').add({
      'name': 'More',
      'imageUrl': 'https://raw.githubusercontent.com/moizzulfiqar24/app_dev_final/834fa60f9805615f2d036fa0ee9a89f46a548dc3/assets/images/1.png',
    });

    // Products
    await firestore.collection('products').add({
      'name': 'TV',
      'imageUrl': 'https://github.com/moizzulfiqar24/app_dev_final/blob/main/assets/images/tv.jpg?raw=true',
      'price': 59.99,
      'isPopular': true,
    });
    await firestore.collection('products').add({
      'name': 'Running Shoes',
      'imageUrl': 'https://github.com/moizzulfiqar24/app_dev_final/blob/main/assets/images/shoe.jpg?raw=true',
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
