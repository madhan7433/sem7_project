import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends State<ProductDetailsScreen> {

  int quantity = 1;

  @override
  Widget build(BuildContext context) {

    final product = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
  child: Container(
    width: 250,
    height: 250,
    decoration: BoxDecoration(
      color: const Color(0xFF181818),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Center(
      child: Text(
        product.image,
        style: const TextStyle(
          fontSize: 120,
        ),
      ),
    ),
  ),
),

const SizedBox(height: 25),

Text(
  product.name,
  style: const TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 10),

const Row(
  children: [
    Icon(
      Icons.star,
      color: Colors.amber,
    ),
    SizedBox(width: 5),
    Text(
      "4.8 (126 Reviews)",
      style: TextStyle(
        color: Colors.white70,
      ),
    ),
  ],
),

const SizedBox(height: 15),

Text(
  "₹${product.price}/${product.unit}",
  style: const TextStyle(
    color: Colors.orange,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 30),
Container(
  padding: const EdgeInsets.all(18),
  decoration: BoxDecoration(
    color: const Color(0xFF181818),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: Colors.orange.withValues(alpha: .15),
    ),
  ),
  child: Row(
    children: [

      CircleAvatar(
        radius: 28,
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),

      const SizedBox(width: 15),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Sold by",
              style: TextStyle(
                color: Colors.white54,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              product.farmerName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 6),

            Row(
              children: [

                const Icon(
                  Icons.location_on,
                  color: Colors.orange,
                  size: 16,
                ),

                const SizedBox(width: 4),

                Expanded(
                  child: Text(
                    product.location,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      const Icon(
        Icons.chat_bubble_outline,
        color: Colors.orange,
      ),
    ],
  ),
),
          
const SizedBox(height: 25),

const Text(
  "Description",
  style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 12),

Text(
  product.description,
  style: const TextStyle(
    color: Colors.white70,
    fontSize: 15,
    height: 1.6,
  ),
),

const SizedBox(height: 30),

const Text(
  "Quantity",
  style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 18,
    vertical: 12,
  ),
  decoration: BoxDecoration(
    color: const Color(0xFF181818),
    borderRadius: BorderRadius.circular(18),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      IconButton(
        onPressed: () {
          if (quantity > 1) {
            setState(() {
              quantity--;
            });
          }
        },
        icon: const Icon(
          Icons.remove_circle_outline,
          color: Colors.orange,
        ),
      ),

      Text(
        "$quantity ${product.unit}",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      IconButton(
        onPressed: () {
          setState(() {
            quantity++;
          });
        },
        icon: const Icon(
          Icons.add_circle_outline,
          color: Colors.orange,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 30),

const Text(
  "Delivery",
  style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 12),

Container(
  padding: const EdgeInsets.all(18),
  decoration: BoxDecoration(
    color: const Color(0xFF181818),
    borderRadius: BorderRadius.circular(18),
  ),
  child: const Row(
    children: [

      Icon(
        Icons.local_shipping_rounded,
        color: Colors.orange,
      ),

      SizedBox(width: 12),

      Expanded(
        child: Text(
          "Delivery within 2-3 days",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ],
  ),
),

const SizedBox(height: 35),

SizedBox(
  width: double.infinity,
  height: 55,
  child: OutlinedButton.icon(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const CartScreen(),
        ),
      );
    },
    icon: const Icon(
      Icons.shopping_cart_outlined,
      color: Colors.orange,
    ),
    label: const Text(
      "Add to Cart",
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.orange,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
),

const SizedBox(height: 16),

SizedBox(
  width: double.infinity,
  height: 58,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const CartScreen(),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: const Text(
      "Buy Now",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}