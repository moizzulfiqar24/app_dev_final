import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  final List<String> cardImages = [
    'assets/images/card1.jpg',
    'assets/images/card2.jpg',
    'assets/images/card3.jpg',
  ];

  final List<Map<String, dynamic>> transactions = [
    {
      'title': 'Netflix',
      'date': '15 Dec 2024',
      'amount': '\$15.48',
    },
    {
      'title': 'Spotify',
      'date': '14 Dec 2024',
      'amount': '\$19.90',
    },
    {
      'title': 'Netflix',
      'date': '12 Dec 2024',
      'amount': '\$15.48',
    },
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Header
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text("Chards", // Intentional typo based on UI
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      const _TopIcon(icon: Icons.help_outline),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // PageView for Cards
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      itemCount: cardImages.length,
                      controller: PageController(viewportFraction: 0.85),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              cardImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Last Activities Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Last activities",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("Open all", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Transactions List
                  Column(
                    children: transactions.map((txn) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xFFF5F5F5),
                              child:
                                  Icon(Icons.star_border, color: Colors.black),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(txn['title'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(txn['date'],
                                      style:
                                          const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                            Text(txn['amount'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: 1, // Cards tab selected
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) return; // Already on Cards

          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/pix');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/notes');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/extract');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: 'Cards'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Pix'),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Extract'),
        ],
      ),
    );
  }
}

// Top icon with border
class _TopIcon extends StatelessWidget {
  final IconData icon;
  const _TopIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Icon(icon, size: 20, color: Colors.black),
    );
  }
}
