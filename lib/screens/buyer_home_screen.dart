import 'package:flutter/material.dart';

import '../widgets/custom_header.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// Header
              const CustomHeader(
                farmerName: "Madhan",
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Search Bar
Container(
  height: 56,
  decoration: BoxDecoration(
    color: const Color(0xFF181818),
    borderRadius: BorderRadius.circular(18),
    border: Border.all(
      color: const Color(0xFFFF9800).withValues(alpha: 0.20),
    ),
  ),
  child: const TextField(
    style: TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: Icon(
        Icons.search_rounded,
        color: Color(0xFF017422),
      ),
      hintText: "Search vegetables, fruits...",
      hintStyle: TextStyle(
        color: Colors.white54,
      ),
    ),
  ),
),

const SizedBox(height: 30),
const Text(
  "Categories",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 18),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    _categoryItem(
      Icons.eco_rounded,
      "Vegetables",
    ),

    _categoryItem(
      Icons.apple_rounded,
      "Fruits",
    ),

    _categoryItem(
      Icons.grass_rounded,
      "Grains",
    ),

    _categoryItem(
      Icons.spa_rounded,
      "Spices",
    ),
  ],
),

const SizedBox(height: 32),
const Text(
  "Featured Products",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 18),

SizedBox(
  height: 240,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [

      _productCard(
        emoji: "🥬",
        name: "Fresh Tomato",
        price: "₹28 / kg",
      ),

      const SizedBox(width: 16),

      _productCard(
        emoji: "🌽",
        name: "Sweet Corn",
        price: "₹42 / kg",
      ),

      const SizedBox(width: 16),

      _productCard(
        emoji: "🥭",
        name: "Organic Mango",
        price: "₹120 / kg",
      ),

    ],
  ),
),

const SizedBox(height: 30),
const Text(
  "🔥 Today's Deals",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 18),

Container(
  width: double.infinity,
  padding: const EdgeInsets.all(18),
  decoration: BoxDecoration(
    color: const Color(0xFF181818),
    borderRadius: BorderRadius.circular(22),
    border: Border.all(
      color: const Color(0xFFFF9800)
          .withValues(alpha: 0.20),
    ),
  ),
  child: Row(
    children: [

      Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: const Color(0xFFFF9800)
              .withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Center(
          child: Text(
            "🥭",
            style: TextStyle(fontSize: 48),
          ),
        ),
      ),

      const SizedBox(width: 18),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Organic Mango",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Freshly picked from nearby farms",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [

                const Text(
                  "₹120/kg",
                  style: TextStyle(
                    color: Color(0xFF017422),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFFF9800),
                  ),
                  child: const Text(
                    "Buy",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
),

const SizedBox(height: 30),
const Text(
  "Nearby Farmers",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 18),

_farmerCard(
  "Ramesh Kumar",
  "Tomato, Onion",
  "2.4 km away",
),

const SizedBox(height: 14),

_farmerCard(
  "Suresh",
  "Mango, Banana",
  "4.8 km away",
),

const SizedBox(height: 30),
const Text(
  "Recent Orders",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 18),

Container(
  padding: const EdgeInsets.all(18),
  decoration: BoxDecoration(
    color: const Color(0xFF181818),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: const Color(0xFFFF9800)
          .withValues(alpha: 0.20),
    ),
  ),
  child: const Row(
    children: [

      CircleAvatar(
        radius: 26,
        backgroundColor: Color(0x22017422),
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Color(0xFF017422),
        ),
      ),

      SizedBox(width: 16),

      Expanded(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              "Order #1258",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 5),

            Text(
              "Fresh Tomatoes • Delivered",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),

      Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
    ],
  ),
),

const SizedBox(height: 40),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _categoryItem(
  IconData icon,
  String title,
) {
  return Column(
    children: [

      Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF181818),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFFF9800)
                .withValues(alpha: 0.20),
          ),
        ),
        child: Icon(
          icon,
          color: const Color(0xFFFF9800),
          size: 32,
        ),
      ),

      const SizedBox(height: 10),

      SizedBox(
        width: 75,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}
Widget _productCard({
  required String emoji,
  required String name,
  required String price,
}) {
  return Container(
    width: 170,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF181818),
      borderRadius: BorderRadius.circular(22),
      border: Border.all(
        color: const Color(0xFFFF9800)
            .withValues(alpha: 0.20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Center(
          child: Text(
            emoji,
            style: const TextStyle(
              fontSize: 52,
            ),
          ),
        ),

        const SizedBox(height: 18),

        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          price,
          style: const TextStyle(
            color: Color(0xFF017422),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        const Spacer(),

        SizedBox(
          width: double.infinity,
          height: 42,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 18,
            ),
            label: const Text("Buy"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF9800),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
Widget _farmerCard(
  String name,
  String crops,
  String distance,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF181818),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: const Color(0xFFFF9800)
            .withValues(alpha: 0.20),
      ),
    ),
    child: Row(
      children: [

        const CircleAvatar(
          radius: 28,
          backgroundColor: Color(0x22017422),
          child: Icon(
            Icons.person,
            color: Color(0xFF017422),
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                crops,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                distance,
                style: const TextStyle(
                  color: Color(0xFF017422),
                ),
              ),
            ],
          ),
        ),

        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF9800),
          ),
          child: const Text(
            "View",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}