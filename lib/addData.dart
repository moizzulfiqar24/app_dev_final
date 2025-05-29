import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreSeederScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void seedData() async {
    // Banners
    await firestore.collection('banners').add({
      'imageUrl': 'https://via.placeholder.com/600x200.png?text=Banner+1',
    });
    await firestore.collection('banners').add({
      'imageUrl': 'https://via.placeholder.com/600x200.png?text=Banner+2',
    });

    // Categories
    await firestore.collection('categories').add({
      'name': 'Electronics',
      'imageUrl': 'https://via.placeholder.com/100x100.png?text=Electronics',
    });
    await firestore.collection('categories').add({
      'name': 'Shoes',
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
