import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  final String username;
  final String dateText;
  final String price;
  final String status;

  const Transactions({
    super.key,
    required this.username,
    required this.dateText,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.account_circle, size: 40),
      title: Text(username,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(
        dateText,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(price,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          Text(status,
              style: TextStyle(
                  color: status == 'Completed' ? Colors.green : Colors.red)),
        ],
      ),
    );
  }
}
