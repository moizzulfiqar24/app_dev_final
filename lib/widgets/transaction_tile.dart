import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionTile extends StatelessWidget {
  final Transaction txn;

  const TransactionTile({super.key, required this.txn});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
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
            child: Icon(Icons.star_border, color: Colors.black),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(txn.title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(txn.date, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Text(txn.amount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
        ],
      ),
    );
  }
}
