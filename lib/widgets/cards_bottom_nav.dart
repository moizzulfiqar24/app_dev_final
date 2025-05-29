import 'package:flutter/material.dart';

class CardsBottomNav extends StatelessWidget {
  final void Function(int) onTabSelected;

  const CardsBottomNav({super.key, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      currentIndex: 1,
      type: BottomNavigationBarType.fixed,
      onTap: onTabSelected,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cards'),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Pix'),
        BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Extract'),
      ],
    );
  }
}
