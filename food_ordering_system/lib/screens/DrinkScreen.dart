import 'package:flutter/material.dart';

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({super.key});

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Item Name
              const Text(
                'Fresh Lemonade',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
              
                ),
              ),
              const SizedBox(height: 10),
              // Item Price
              const Text(
                'Rs.750',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 20),
              // Pizza Image
              ClipRRect(
                
                child: Image.asset(
                  'assets/fresh_lemonade.jpg', // Replace with your image path
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              // Quantity Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() => quantity--);
                      }
                    },
                    icon: const Icon(Icons.remove_circle, color: Colors.deepOrange, size: 30),
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() => quantity++);
                    },
                    icon: const Icon(Icons.add_circle, color: Colors.deepOrange, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Description Section
              const Text(
                'A refreshing blend of freshly squeezed lemons, a touch of sweetness, and a splash of sparkling water, served over ice. Perfectly balanced to quench your thirst and brighten your day! 🍋✨',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              // Add to Cart Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your navigation or functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
