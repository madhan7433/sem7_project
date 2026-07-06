import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.primary
              : AppColors.card,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(
                isUser ? 18 : 4),
            bottomRight: Radius.circular(
                isUser ? 4 : 18),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}