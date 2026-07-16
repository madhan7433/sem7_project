import 'package:flutter/material.dart';

class FarmerProductsScreen extends StatelessWidget {
  const FarmerProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0B0B),
        elevation: 0,
        title: const Text(
          "My Crops",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/sellProduct");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF22C55E),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.add),
              label: const Text("Add"),
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          ProductCard(
            emoji: "🥭",
            name: "Organic Mango",
            price: "₹120/kg",
            quantity: "120 Kg",
          ),

          SizedBox(height: 16),

          ProductCard(
            emoji: "🍅",
            name: "Fresh Tomato",
            price: "₹28/kg",
            quantity: "80 Kg",
          ),

          SizedBox(height: 16),

          ProductCard(
            emoji: "🌽",
            name: "Sweet Corn",
            price: "₹42/kg",
            quantity: "50 Kg",
          ),

          SizedBox(height: 16),

          ProductCard(
            emoji: "🥬",
            name: "Spinach",
            price: "₹25/bunch",
            quantity: "200 Bunches",
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String emoji;
  final String name;
  final String price;
  final String quantity;

  const ProductCard({
    super.key,
    required this.emoji,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF22C55E).withOpacity(.15),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 42),
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF22C55E),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Available : $quantity",
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [

                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text("Edit"),
                    ),

                    const SizedBox(width: 10),

                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      icon: const Icon(Icons.delete, size: 18),
                      label: const Text("Delete"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}