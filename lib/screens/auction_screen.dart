import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AuctionScreen extends StatelessWidget {
  const AuctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          "Auction Screen",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}