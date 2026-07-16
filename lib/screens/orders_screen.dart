import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0B0B0B),
      body: Center(
        child: Text(
          "Orders Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}