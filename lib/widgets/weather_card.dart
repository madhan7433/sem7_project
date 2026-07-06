import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String temperature;
  final String condition;
  final VoidCallback? onTap;

  const WeatherCard({
    super.key,
    required this.temperature,
    required this.condition,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.green.withValues(alpha: 0.18),
          ),
        ),
        child: Row(
          children: [
            const Text(
              "🌤",
              style: TextStyle(fontSize: 28),
            ),

            const SizedBox(width: 14),

            Text(
              temperature,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  condition,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 3),

                const Text(
                  "View Details",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 11,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 10),

            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.white54,
            ),
          ],
        ),
      ),
    );
  }
}