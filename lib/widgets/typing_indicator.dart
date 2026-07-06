import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: 12),
            Text(
              "FarmPilot is thinking...",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}