import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage(
                'assets/images/MuhumuzaImage.png', // Replace with actual image path
              ),
            ),
            SizedBox(height: 20.0),
            // Center the input fields horizontally
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your username', // Optional: Add hint text
                    border: OutlineInputBorder(), // Optional: Add border styling
                    // You can customize other properties like prefixIcon, suffixIcon, etc.
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Phone Number:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your phone number', // Optional: Add hint text
                    border: OutlineInputBorder(), // Optional: Add border styling
                    // You can customize other properties like prefixIcon, suffixIcon, etc.
                  ),
                ),
              ],
            ),
            SizedBox(height: 100.0), // Adjust spacing as needed
            // Ensure the button stretches to match the width of the input fields
            SizedBox(
              width: double.infinity,
              height: 65,
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit action
                  Navigator.pop(context); // Navigate back to previous screen
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 143, 34, 246)), // Use RGBA color
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Add additional space below the button
          ],
        ),
      ),
    );
  }
}