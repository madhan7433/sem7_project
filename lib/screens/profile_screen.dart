import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}