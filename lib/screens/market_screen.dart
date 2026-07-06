import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          "Market Screen",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}