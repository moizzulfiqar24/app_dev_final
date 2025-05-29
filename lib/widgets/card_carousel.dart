import 'package:flutter/material.dart';

class CardCarousel extends StatelessWidget {
  final List<String> cardImages;

  const CardCarousel({super.key, required this.cardImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        itemCount: cardImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(cardImages[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
