import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/cards_header.dart';
import '../widgets/card_carousel.dart';
import '../widgets/activity_header.dart';
import '../widgets/transaction_tile.dart';
import '../widgets/cards_bottom_nav.dart';

class CardsScreen extends StatelessWidget {
  final List<String> cardImages = [
    'assets/images/card1.jpg',
    'assets/images/card2.jpg',
    'assets/images/card3.jpg',
  ];

  final List<Transaction> transactions = [
    Transaction(title: 'Netflix', date: '15 Dec 2024', amount: '\$15.48'),
    Transaction(title: 'Spotify', date: '14 Dec 2024', amount: '\$19.90'),
    Transaction(title: 'Netflix', date: '12 Dec 2024', amount: '\$15.48'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFED1E8), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CardsHeader(),
                const SizedBox(height: 24),
                CardCarousel(cardImages: cardImages),
                const SizedBox(height: 32),
                const ActivityHeader(),
                const SizedBox(height: 16),
                ...transactions
                    .map((txn) => TransactionTile(txn: txn))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CardsBottomNav(onTabSelected: (index) {
        if (index == 1) return;
        final routes = ['/home', null, '/pix', '/notes', '/extract'];
        if (index >= 0 && index < routes.length && routes[index] != null) {
          Navigator.pushReplacementNamed(context, routes[index]!);
        }
      }),
    );
  }
}
