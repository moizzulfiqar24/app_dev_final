import 'package:flutter/material.dart';
import 'top_icon.dart';

class CardsHeader extends StatelessWidget {
  const CardsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 20,
          child: Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Center(
            child: Text(
              "Chards",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        TopIcon(icon: Icons.help_outline),
      ],
    );
  }
}
