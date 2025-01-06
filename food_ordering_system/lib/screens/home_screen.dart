// lib/screens/home_screen.dart
import 'package:cw2/screens/burger_category.dart';
import 'package:cw2/screens/burger_details.dart';
import 'package:cw2/screens/DrinkScreen.dart';
import 'package:cw2/screens/item.dart';
import 'package:cw2/screens/pizza_category.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
//import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/peparooni.png',
                height: 180,
              ),
              const SizedBox(height: 32),
              const Text(
                'Pizza Planet',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Order delicious pizzas from the comfort of your home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Get Started',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DrinkScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
