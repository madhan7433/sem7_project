import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/ai_chat_screen.dart';

class QuickActions extends StatelessWidget {
  final String role;

  const QuickActions({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    final actions =
        role == "farmer" ? _farmerActions(context) : _buyerActions(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "⚡ Quick Actions",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 18),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: actions.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.12,
          ),
          itemBuilder: (context, index) {
            final item = actions[index];

            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: item.onTap,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        item.icon,
                        color: AppColors.primary,
                        size: 26,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // ===================== FARMER ======================

  static List<_ActionItem> _farmerActions(BuildContext context) => [
        _ActionItem(
          icon: Icons.smart_toy_rounded,
          title: "Ask FarmPilot AI",
          subtitle: "AI farming assistant",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AIChatScreen(),
              ),
            );
          },
        ),

        _ActionItem(
          icon: Icons.psychology_alt_rounded,
          title: "Crop Advisor",
          subtitle: "Smart recommendations",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Coming Soon 🚀"),
              ),
            );
          },
        ),

        _ActionItem(
          icon: Icons.trending_up_rounded,
          title: "Market Trends",
          subtitle: "Demand & pricing",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Coming Soon 🚀"),
              ),
            );
          },
        ),

        _ActionItem(
          icon: Icons.agriculture_rounded,
          title: "Equipment",
          subtitle: "Rent machinery",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Coming Soon 🚀"),
              ),
            );
          },
        ),
      ];

  // ===================== BUYER ======================

  static List<_ActionItem> _buyerActions(BuildContext context) => [
        _ActionItem(
          icon: Icons.shopping_cart_rounded,
          title: "Buy Crops",
          subtitle: "Fresh products",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Coming Soon 🚀"),
              ),
            );
          },
        ),

        _ActionItem(
          icon: Icons.favorite_rounded,
          title: "Wishlist",
          subtitle: "Saved products",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Coming Soon 🚀"),
              ),
            );
          },
        ),

        _ActionItem(
          icon: Icons.local_shipping_rounded,
          title: "Orders",
          subtitle: "Track deliveries",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Coming Soon 🚀"),
              ),
            );
          },
        ),

        _ActionItem(
          icon: Icons.bar_chart_rounded,
          title: "Price Trends",
          subtitle: "Market analysis",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Coming Soon 🚀"),
              ),
            );
          },
        ),
      ];
}

class _ActionItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}