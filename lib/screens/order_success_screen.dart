import 'package:flutter/material.dart';
import '../navigation/buyer_bottom_nav.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
  width: 140,
  height: 140,
  decoration: BoxDecoration(
    color: Colors.green.withValues(alpha: .15),
    shape: BoxShape.circle,
  ),
  child: const Icon(
    Icons.check_circle_rounded,
    color: Colors.green,
    size: 90,
  ),
),

const SizedBox(height: 35),

const Text(
  "Order Placed!",
  style: TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

const Text(
  "Your order has been placed successfully.\nThe farmer has been notified.",
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white70,
    fontSize: 16,
    height: 1.5,
  ),
),

const SizedBox(height: 35),
Container(
  width: double.infinity,
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: const Color(0xFF181818),
    borderRadius: BorderRadius.circular(20),
  ),
  child: const Column(
    children: [

      Row(
        children: [

          Text(
            "Order ID",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          Spacer(),

          Text(
            "#VID12345",
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      SizedBox(height: 15),

      Row(
        children: [

          Text(
            "Estimated Delivery",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          Spacer(),

          Text(
            "2-3 Days",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    ],
  ),
),

const SizedBox(height: 40),
SizedBox(
  width: double.infinity,
  height: 58,
  child: ElevatedButton(
    onPressed: () {
      Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (_) => const BuyerBottomNav(),
  ),
  (route) => false,
);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    child: const Text(
      "Back to Home",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 16),

SizedBox(
  width: double.infinity,
  height: 58,
  child: OutlinedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.orange,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    child: const Text(
      "View Orders",
      style: TextStyle(
        color: Colors.orange,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}