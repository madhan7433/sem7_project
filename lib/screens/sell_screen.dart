import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          "Sell Screen",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}