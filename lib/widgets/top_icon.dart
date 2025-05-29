import 'package:flutter/material.dart';

class TopIcon extends StatelessWidget {
  final IconData icon;

  const TopIcon({super.key, required this.icon});

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
