import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        color: AppColors.background,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Ask FarmPilot...",
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                  ),
                  filled: true,
                  fillColor: AppColors.card,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.primary,
              child: IconButton(
                onPressed: onSend,
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}