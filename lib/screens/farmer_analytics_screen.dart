import 'package:flutter/material.dart';

class FarmerAnalyticsScreen extends StatelessWidget {
  const FarmerAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0B0B),
        elevation: 0,
        title: const Text(
          "Insights",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Row(
              children: const [
                Expanded(
                  child: StatCard(
                    title: "Revenue",
                    value: "₹48K",
                    icon: Icons.currency_rupee,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: StatCard(
                    title: "Orders",
                    value: "124",
                    icon: Icons.shopping_bag,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: const [
                Expanded(
                  child: StatCard(
                    title: "Products",
                    value: "18",
                    icon: Icons.agriculture,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: StatCard(
                    title: "Customers",
                    value: "86",
                    icon: Icons.people,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF181818),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [

                  Text(
                    "Top Selling Crops",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  CropTile(
                    emoji: "🥭",
                    name: "Organic Mango",
                    sold: "320 Kg Sold",
                  ),

                  CropTile(
                    emoji: "🍅",
                    name: "Fresh Tomato",
                    sold: "260 Kg Sold",
                  ),

                  CropTile(
                    emoji: "🌽",
                    name: "Sweet Corn",
                    sold: "180 Kg Sold",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CircleAvatar(
            backgroundColor: color.withOpacity(.2),
            child: Icon(icon, color: color),
          ),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}

class CropTile extends StatelessWidget {
  final String emoji;
  final String name;
  final String sold;

  const CropTile({
    super.key,
    required this.emoji,
    required this.name,
    required this.sold,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        emoji,
        style: const TextStyle(fontSize: 30),
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        sold,
        style: const TextStyle(
          color: Colors.white60,
        ),
      ),
      trailing: const Icon(
        Icons.trending_up,
        color: Colors.green,
      ),
    );
  }
}