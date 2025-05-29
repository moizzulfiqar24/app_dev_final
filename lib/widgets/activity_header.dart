import 'package:flutter/material.dart';

class ActivityHeader extends StatelessWidget {
  const ActivityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text("Last activities",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("Open all", style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
