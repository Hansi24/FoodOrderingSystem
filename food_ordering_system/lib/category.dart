import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'utils/secure_storage.dart';  // Import the SecureStorage class

class CategoryPage extends StatelessWidget {
  final String category; // Category passed from previous page
  CategoryPage({required this.category});

  // Fetch items for the selected category from the API
  Future<List<dynamic>> fetchCategoryItems() async {
    // Get the token from secure storage
    String? token = await SecureStorage.getToken();

    if (token == null) {
      throw Exception('No token found!');
    }

    // Set up the API request with the Bearer token in headers
    final url = Uri.parse('http://localhost:5000/api/food/cat-food?cat=$category');
    final response = await http.get(
      url,
      headers: {
        'Authorization': token, // Add the token to the request header
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Parse JSON response into a list
    } else {
      throw Exception('Failed to load category items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Items'),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCategoryItems(), // Fetch the items from the API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No items available for this category.'));
          } else {
            // Display fetched items in a list view
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return ListTile(
                  title: Text(item['name']), // Display item name
                  subtitle: Text(item['description']), // Display item description
                  trailing: Text("\$${item['price']}"), // Display item price
                  onTap: () {
                    // Navigate to item details if needed
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
