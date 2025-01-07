import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background Color
          Positioned.fill(
            child: Container(
              color: Colors.orangeAccent.withOpacity(0.1),
            ),
          ),
          // Profile Content
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  // Profile Picture with Card
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/profile_placeholder.jpg"),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Profile Details Card
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileItem(
                            icon: Icons.person,
                            label: "Username",
                            value: "JohnDoe123",
                          ),
                          Divider(color: Colors.grey[300]),
                          ProfileItem(
                            icon: Icons.location_on,
                            label: "Address",
                            value: "1234 Elm Street, Springfield",
                          ),
                          Divider(color: Colors.grey[300]),
                          ProfileItem(
                            icon: Icons.phone,
                            label: "Phone",
                            value: "+1 123 456 7890",
                          ),
                          Divider(color: Colors.grey[300]),
                          ProfileItem(
                            icon: Icons.email,
                            label: "Email",
                            value: "johndoe@example.com",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Edit Profile Button
                  ElevatedButton.icon(
                    onPressed: () {
                      print("Edit Profile Clicked");
                    },
                    icon: Icon(Icons.edit, color: Colors.white),
                    label: Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.orangeAccent, size: 30),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfilePage(),
    ));
