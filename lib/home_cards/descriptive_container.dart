import 'package:flutter/material.dart';
import 'package:promote_her_app/home_cards/detial_screen.dart'; // Import the detail screen file

class DescriptiveContainer extends StatelessWidget {
  final String imagePath;
  final String name;
  final String salary; // Add salary parameter
  final String description;

  DescriptiveContainer({
    required this.imagePath,
    required this.name,
    required this.salary, // Add salary parameter
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Reduced width
      padding: EdgeInsets.all(4.0), // Reduced padding
      margin: EdgeInsets.all(4.0), // Reduced margin
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(6.0), // Reduced border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1, // Reduced spread radius
            blurRadius: 3, // Reduced blur radius
            offset: Offset(0, 2), // Slightly adjusted offset
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60.0, // Reduced image width
              height: 60.0, // Reduced image height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0), // Reduced border radius
                border: Border.all(color: Colors.blue, width: 1.5), // Reduced border width
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6.0), // Reduced vertical spacing
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14.0, // Reduced font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2.0), // Reduced vertical spacing
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0), // Reduced font size for description
                ),
                const SizedBox(height: 6.0), // Reduced vertical spacing
                Container(
                  width: 120, // Reduced button width
                  height: 36, // Reduced button height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            imagePath: imagePath,
                            name: name,
                            salary: salary, // Pass salary parameter
                            description: description,
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: const Text(
                      'Contact us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0, // Reduced button font size
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
