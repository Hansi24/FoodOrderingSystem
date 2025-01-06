import 'package:flutter/material.dart';

class PizzaCategoriesScreen extends StatelessWidget {
  const PizzaCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pizzas = [
      {
        "name": "Margherita",
        "image": "assets/peparooni.jpg",
        "price": "\$9.99",
      },
      {
        "name": "Pepperoni",
        "image": "assets/peparooni.jpg",
        "price": "\$12.99",
      },
      {
        "name": "BBQ Chicken",
        "image": "assets/peparooni.jpg",
        "price": "\$14.99",
      },
      {
        "name": "Veggie Supreme",
        "image": "assets/peparooni.jpg",
        "price": "\$11.99",
      },
      {
        "name": "Hawaiian",
        "image": "assets/peparooni.jpg",
        "price": "\$13.99",
      },
      {
        "name": "Meat Lovers",
        "image": "assets/peparooni.jpg",
        "price": "\$15.99",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Categories'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          itemCount: pizzas.length,
          itemBuilder: (context, index) {
            final pizza = pizzas[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Pizza Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.asset(
                      pizza['image'],
                      height: 200, // Adjusted height
                      width: double.infinity,
                      fit: BoxFit.contain, // Ensures the full pizza image is visible
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Pizza Name
                  Text(
                    pizza['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Pizza Price
                  Text(
                    pizza['price'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Add to Cart Button
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
