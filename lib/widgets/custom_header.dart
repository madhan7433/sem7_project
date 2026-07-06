import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomHeader extends StatelessWidget {
  final String farmerName;

  const CustomHeader({
    super.key,
    required this.farmerName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            children: [
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.menu_rounded,
                  color: AppColors.white,
                  size: 28,
                ),
              ),

              const SizedBox(width: 12),

              const Icon(
                Icons.agriculture_rounded,
                color: AppColors.primary,
                size: 32,
              ),

              const SizedBox(width: 8),

              const Text(
                "FarmDirect",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.white,
                  size: 26,
                ),
              ),

              const SizedBox(width: 6),

              const CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          const Text(
            "Welcome back,",
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            "$farmerName 👋",
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Let's make today productive 🌱",
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}