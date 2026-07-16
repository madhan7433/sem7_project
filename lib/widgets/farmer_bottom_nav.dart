import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/farmer_products_screen.dart';
import '../screens/farmer_orders_screen.dart';
import '../screens/farmer_analytics_screen.dart';
import '../screens/farmer_profile_screen.dart';

class FarmerBottomNav extends StatefulWidget {
  const FarmerBottomNav({super.key});

  @override
  State<FarmerBottomNav> createState() => _FarmerBottomNavState();
}

class _FarmerBottomNavState extends State<FarmerBottomNav> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    FarmerProductsScreen(),
    FarmerOrdersScreen(),
    FarmerAnalyticsScreen(),
    FarmerProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Theme(
              data: Theme.of(context).copyWith(
                navigationBarTheme: NavigationBarThemeData(
                  backgroundColor: const Color(0xFF181818),
                  indicatorColor:
                      const Color(0xFF22C55E).withOpacity(.18),

                  labelTextStyle:
                      WidgetStateProperty.resolveWith<TextStyle>(
                    (states) {
                      final selected =
                          states.contains(WidgetState.selected);

                      return TextStyle(
                        fontSize: 11,
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: selected
                            ? const Color(0xFF22C55E)
                            : Colors.white60,
                      );
                    },
                  ),

                  iconTheme:
                      WidgetStateProperty.resolveWith<IconThemeData>(
                    (states) {
                      final selected =
                          states.contains(WidgetState.selected);

                      return IconThemeData(
                        size: 24,
                        color: selected
                            ? const Color(0xFF22C55E)
                            : Colors.white60,
                      );
                    },
                  ),
                ),
              ),
              child: NavigationBar(
                backgroundColor: const Color(0xFF181818),
                indicatorColor:
                    const Color(0xFF22C55E).withOpacity(.18),
                height: 72,
                selectedIndex: selectedIndex,

                labelBehavior:
                    NavigationDestinationLabelBehavior.alwaysShow,

                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },

                destinations: const [

                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home_rounded),
                    label: "Home",
                  ),

                  NavigationDestination(
                    icon: Icon(Icons.agriculture_outlined),
                    selectedIcon:
                        Icon(Icons.agriculture_rounded),
                    label: "My Crops",
                  ),

                  NavigationDestination(
                    icon:
                        Icon(Icons.shopping_bag_outlined),
                    selectedIcon:
                        Icon(Icons.shopping_bag_rounded),
                    label: "Orders",
                  ),

                  NavigationDestination(
                    icon: Icon(Icons.bar_chart_outlined),
                    selectedIcon:
                        Icon(Icons.bar_chart_rounded),
                    label: "Insights",
                  ),

                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon:
                        Icon(Icons.person_rounded),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}