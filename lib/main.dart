import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/role_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const FarmDirectApp());
}

class FarmDirectApp extends StatelessWidget {
  const FarmDirectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmDirect',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF121212),
        fontFamily: 'Poppins',
      ),

      // First screen
      home: const WelcomeScreen(),

      // Named routes
      routes: {
  '/role': (context) => const RoleScreen(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const Placeholder(),
},
    );
  }
}