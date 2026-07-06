import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../screens/home_screen.dart';
import '../screens/market_screen.dart';
import '../screens/sell_screen.dart';
import '../screens/auction_screen.dart';
import '../screens/profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    MarketScreen(),
    SellScreen(),
    AuctionScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: Container(
        height: 78,
        decoration: const BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,

          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          type: BottomNavigationBarType.fixed,

          backgroundColor: Colors.transparent,

          elevation: 0,

          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.white54,

          selectedFontSize: 12,
          unselectedFontSize: 12,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront_rounded),
              label: "Market",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_rounded),
              label: "Sell",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gavel_rounded),
              label: "Auction",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}