import 'package:flutter/material.dart';

class BurgerCategoriesScreen extends StatelessWidget {
  const BurgerCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> burgers = [
      {
        "name": "Classic Burger",
        "image": "assets/burger.jpg",
        "price": "\$8.99",
      },
      {
        "name": "Cheese Burger",
        "image": "assets/burger.jpg",
        "price": "\$9.99",
      },
      {
        "name": "Bacon Burger",
        "image": "assets/burger.jpg",
        "price": "\$10.99",
      },
      {
        "name": "Veggie Burger",
        "image": "assets/burger.jpg",
        "price": "\$7.99",
      },
      {
        "name": "Chicken Burger",
        "image": "assets/burger.jpg",
        "price": "\$9.49",
      },
      {
        "name": "Spicy Burger",
        "image": "assets/burger.jpg",
        "price": "\$10.49",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Burger Categories'),
        backgroundColor: Colors.brown,
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
          itemCount: burgers.length,
          itemBuilder: (context, index) {
            final burger = burgers[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Burger Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.asset(
                      burger['image'],
                      height: 200, // Adjusted height for larger images
                      width: double.infinity,
                      fit: BoxFit.contain, // Ensures full image is displayed
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Burger Name
                  Text(
                    burger['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),

                  // Burger Price
                  Text(
                    burger['price'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.brown,
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
