import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF181818),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.35),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildItem(
              icon: Icons.home_rounded,
              label: "Home",
              index: 0,
            ),
            _buildItem(
              icon: Icons.inventory_2_rounded,
              label: "Orders",
              index: 1,
            ),
            _buildItem(
              icon: Icons.chat_bubble_rounded,
              label: "Chat",
              index: 2,
            ),
            _buildItem(
              icon: Icons.person_rounded,
              label: "Profile",
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final selected = currentIndex == index;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0x22017422)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                duration: const Duration(milliseconds: 250),
                scale: selected ? 1.15 : 1,
                child: Icon(
                  icon,
                  color: selected
                      ? const Color(0xFF017422)
                      : Colors.grey,
                  size: 24,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                label,
                style: TextStyle(
                  color: selected
                      ? const Color(0xFF017422)
                      : Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}