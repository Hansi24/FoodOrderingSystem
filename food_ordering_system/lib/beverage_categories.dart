import 'package:flutter/material.dart';

class BeverageCategoriesScreen extends StatelessWidget {
  const BeverageCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> burgers = [
     {
    "name": "Classic Cola",
    "image": "assets/category_beverages.jpg",
    "price": "\$1.99"
  },
  {
    "name": "Fresh Lemonade",
    "image": "assets/category_beverages.jpg",
    "price": "\$2.49"
  },
  {
    "name": "Iced Tea",
    "image": "assets/category_beverages.jpg",
    "price": "\$2.99"
  },
  {
    "name": "Espresso",
    "image": "assets/category_beverages.jpg",
    "price": "\$3.49"
  },
  {
    "name": "Milkshake",
    "image": "assets/category_beverages.jpg",
    "price": "\$4.49"
  },
  {
    "name": "Smoothie",
    "image": "assets/category_beverages.jpg",
    "price": "\$5.49"
  }
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