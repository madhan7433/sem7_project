import 'package:flutter/material.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() =>
      _CheckoutScreenState();
}

class _CheckoutScreenState
    extends State<CheckoutScreen> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0B0B),
        elevation: 0,
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [const Text(
  "Delivery Details",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 20),

_buildField(
  controller: nameController,
  hint: "Full Name",
  icon: Icons.person,
),

const SizedBox(height: 16),

_buildField(
  controller: phoneController,
  hint: "Mobile Number",
  icon: Icons.phone,
),

const SizedBox(height: 16),

_buildField(
  controller: addressController,
  hint: "Delivery Address",
  icon: Icons.location_on,
  maxLines: 3,
),

const SizedBox(height: 30),
const Text(
  "Payment Method",
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
    borderRadius: BorderRadius.circular(18),
  ),
  child: const Row(
    children: [

      Icon(
        Icons.payments_rounded,
        color: Colors.orange,
      ),

      SizedBox(width: 12),

      Expanded(
        child: Text(
          "Cash on Delivery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),

      Icon(
        Icons.check_circle,
        color: Colors.orange,
      ),
    ],
  ),
),

const SizedBox(height: 30),
const Text(
  "Order Summary",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 18),

Container(
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
            "Organic Mango x1",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          Spacer(),

          Text(
            "₹120",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),

      SizedBox(height: 15),

      Row(
        children: [

          Text(
            "Delivery",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          Spacer(),

          Text(
            "₹30",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),

      Divider(
        color: Colors.white24,
        height: 30,
      ),

      Row(
        children: [

          Text(
            "Total",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          Spacer(),

          Text(
            "₹150",
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    ],
  ),
),

const SizedBox(height: 35),
SizedBox(
  width: double.infinity,
  height: 58,
  child: ElevatedButton(
    onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const OrderSuccessScreen(),
    ),
  );
},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    child: const Text(
      "Place Order",
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
    );
  }

  Widget _buildField({
  required TextEditingController controller,
  required String hint,
  required IconData icon,
  int maxLines = 1,
}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    style: const TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white54,
      ),
      prefixIcon: Icon(
        icon,
        color: Colors.orange,
      ),
      filled: true,
      fillColor: const Color(0xFF181818),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
    }