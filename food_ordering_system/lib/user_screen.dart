import 'package:flutter/material.dart';
import 'package:pizza_planet/beverage_categories.dart';
import 'package:pizza_planet/burger_category.dart';
import 'package:pizza_planet/burger_details.dart';
import 'package:pizza_planet/category.dart';
import 'package:pizza_planet/item.dart';
import 'package:pizza_planet/pizza_category.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserScreen(),
  ));
}

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Pizza Planet", style: TextStyle(
                   fontFamily: "BlackBones",)),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orangeAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/user_profile.jpg"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Hello User!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "user@example.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.local_pizza),
              title: Text("Pizza Categories"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>CategoryPage(category: 'Pizza')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: Text("Burger Categories"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryPage(category: 'Burger')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_drink),
              title: Text("Beverages"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryPage(category: 'Beverages')),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                // Handle settings tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () {
                // Handle logout
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),


      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Greeting and Subtitle
              Text(
                "Hello User!",
                style: TextStyle(
                   fontFamily: "BlackBones",
                  
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
              Text(
                "Order and Eat",
                style: TextStyle(
                  fontSize: 18,
                   fontFamily: "BlackBones",
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for food...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Featured Image with Button
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/food_banner.jpg",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrderNowPage()),
                        );
                      },
                      child: Text("Order Now"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Categories Section
              Text(
                "Categories",
                style: TextStyle(
                  fontFamily: "BlackBones",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    JumpingCategoryButton(
  label: "Pizza",
  imagePath: "assets/category_pizza.jpg",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryPage(category: 'Pizza')),
    );
  },
),
JumpingCategoryButton(
  label: "Burgers",
  imagePath: "assets/category_burger.jpg",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryPage(category: 'Burger')),
    );
  },
),
JumpingCategoryButton(
  label: "Beverages",
  imagePath: "assets/category_beverages.jpg",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryPage(category: 'Beverages')),
    );
  },
),

                  ],
                ),
              ),
              SizedBox(height: 30),
              // Popular Foods Section
              Text(
                "Popular Foods",
                style: TextStyle(
                   fontFamily: "BlackBones",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FoodCard(
                      "Pizza",
                      "\$8.99",
                      "assets/category_pizza.jpg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PizzaScreen()),
                        );
                      },
                    ),
                    FoodCard(
                      "Burger",
                      "\$6.49",
                      "assets/category_burger.jpg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BurgerScreen()),
                        );
                      },
                    ),
                    FoodCard(
                      "Beverage",
                      "\$2.99",
                      "assets/category_beverages.jpg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BeveragesPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget for Jumping Categories
class JumpingCategoryButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onTap;

  JumpingCategoryButton(
      {required this.label, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for Food Card
class FoodCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final VoidCallback onTap;

  FoodCard(this.name, this.price, this.imagePath, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Destination Pages
class OrderNowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Now")),
      body: Center(child: Text("Order Now Page")),
    );
  }
}

class PizzaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pizza")),
      body: Center(child: Text("Pizza Page")),
    );
  }
}

class BurgersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Burgers")),
      body: Center(child: Text("Burgers Page")),
    );
  }
}

class BeveragesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beverages")),
      body: Center(child: Text("Beverages Page")),
    );
  }
}
