import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login_screen.dart';
import 'user_screen.dart';

class PizzaPlanetHome extends StatelessWidget {
  // Create an instance of the secure storage
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  // Retrieve the stored token from secure storage
  Future<String?> getStoredToken() async {
    return await secureStorage.read(key: 'auth_token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String?>(
        future: getStoredToken(), // Retrieve token asynchronously
        builder: (context, snapshot) {
          // Check if the token is found in secure storage
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading while waiting
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            // If token exists, navigate to UserScreen
            Future.microtask(() {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserScreen()),
              );
            });
            return SizedBox.shrink(); // Return an empty container while navigating
          } else {
            // If no token exists, show the home screen with Start Now button
            return Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/background.jpg"), // Add your background image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // App Name
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Text(
                      "Pizza",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "BlackBones",
                        fontSize: 150,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Text(
                      "Planet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "BlackBones",
                        fontSize: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Pizza Image
                Positioned(
                  top: 30,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Image.asset(
                      "assets/pizza_logo.png",
                      width: 700,
                      height: 700,
                    ),
                  ),
                ),
                // Start Now Button
                Positioned(
                  bottom: 50,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Start Now",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
