import 'package:flutter/material.dart';

import '../data/demo_data.dart';
import '../models/product_model.dart';
import 'product_details_screen.dart';

class BuyerMarketScreen extends StatefulWidget {
  const BuyerMarketScreen({super.key});

  @override
  State<BuyerMarketScreen> createState() =>
      _BuyerMarketScreenState();
}

class _BuyerMarketScreenState
    extends State<BuyerMarketScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              const Text(
  "Market",
  style: TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 25),

Container(
  height: 56,
  decoration: BoxDecoration(
    color: const Color(0xFF181818),
    borderRadius: BorderRadius.circular(18),
    border: Border.all(
      color: Colors.orange.withValues(alpha: .20),
    ),
  ),
  child: const TextField(
    style: TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: Icon(
        Icons.search,
        color: Colors.orange,
      ),
      hintText: "Search vegetables...",
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

SizedBox(
  height: 105,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [

      _categoryCard(
        Icons.eco_rounded,
        "Vegetables",
      ),

      _categoryCard(
        Icons.apple_rounded,
        "Fruits",
      ),

      _categoryCard(
        Icons.grass_rounded,
        "Grains",
      ),

      _categoryCard(
        Icons.spa_rounded,
        "Spices",
      ),

      _categoryCard(
        Icons.local_florist,
        "Flowers",
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
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: const Color(0xFF181818),
    borderRadius: BorderRadius.circular(22),
    border: Border.all(
      color: Colors.orange.withValues(alpha: .18),
    ),
  ),

  child: Row(
    children: [

      Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.orange.withValues(alpha: .15),
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
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              "Organic Mango",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Freshly harvested today",
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
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
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
  "Featured Products",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 18),

GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: products.length,
  gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: .60,
  ),
  itemBuilder: (context, index) {

    final product = products[index];

    return _productCard(product);

  },
),

const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
Widget _categoryCard(
  IconData icon,
  String title,
) {
  return Container(
    width: 90,
    margin: const EdgeInsets.only(right: 14),
    child: Column(
      children: [

        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF181818),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.orange.withValues(alpha: .20),
            ),
          ),
          child: Icon(
            icon,
            color: Colors.orange,
            size: 34,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
Widget _productCard(
  ProductModel product,
) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            product: product,
          ),
        ),
      );
    },

    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.orange.withValues(alpha: .18),
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Center(
            child: Text(
              product.image,
              style: const TextStyle(
                fontSize: 54,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 5),

          const Row(
            children: [

              Icon(
                Icons.star,
                color: Colors.amber,
                size: 16,
              ),

              SizedBox(width: 4),

              Text(
                "4.8",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [

              Expanded(
                child: Text(
                  "₹${product.price}/${product.unit}",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),

              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.add_shopping_cart_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
    }