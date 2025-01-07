import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pizza_planet/utils/secure_storage.dart';

// Create an instance of the secure storage
final FlutterSecureStorage secureStorage = FlutterSecureStorage();

// Storing a token
Future<void> storeToken(String token) async {
  await secureStorage.write(key: 'auth_token', value: token);
}

// Retrieving a token
Future<String?> getToken() async {
  return await secureStorage.read(key: 'auth_token');
}

// Deleting a token
Future<void> deleteToken() async {
  await secureStorage.delete(key: 'auth_token');
}

class PizzaCategoriesScreen extends StatefulWidget {
  const PizzaCategoriesScreen({super.key});

  @override
  State<PizzaCategoriesScreen> createState() => _PizzaCategoriesScreenState();
}

class _PizzaCategoriesScreenState extends State<PizzaCategoriesScreen> {
  List<dynamic> pizzas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPizzas();
  }

  Future<void> fetchPizzas() async {
    final url = Uri.parse('http://localhost:5000/api/food/cat-food?cat=Pizza'); 
    final token = await SecureStorage.getToken();


    // Retrieve the token
    // final token = await getToken();

    if (token == null) {
      print('No token found. Please authenticate first.');
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('Response body: ${response.body}'); // Debug response
        final Map<String, dynamic> data = jsonDecode(response.body);

        if (data.containsKey('data') && data['data'] is List) {
          setState(() {
            pizzas = data['data'];
            isLoading = false;
          });
        } else {
          print('Unexpected response format: ${response.body}');
          setState(() {
            pizzas = [];
            isLoading = false;
          });
        }
      } else {
        print('Failed to load pizzas: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching pizzas: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : pizzas.isEmpty
                ? const Center(child: Text('No pizzas found.'))
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                              child: Image.network(
                                pizza[
                                    'image'], // Assuming your backend provides image URLs
                                height: 200, // Adjusted height
                                width: double.infinity,
                                fit: BoxFit
                                    .contain, // Ensures the full pizza image is visible
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Pizza Name
                            Text(
                              pizza[
                                  'name'], // Assuming 'name' is a field in the response
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),

                            // Pizza Price
                            Text(
                              '\$${pizza['price']}', // Assuming 'price' is a field in the response
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
                                // Add to cart logic can go here
                                print('Add to cart: ${pizza['name']}');
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
