import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imagePath;
  final String name;
  final String salary;
  final String description;

  DetailScreen({
    required this.imagePath,
    required this.name,
    required this.salary,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Detail Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Container(
              child: Image.asset(
                imagePath,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
           const  SizedBox(height: 60),
            Text(
              name,
              style:const  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
         const    SizedBox(height: 10),
            Text(
              salary,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          const   SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: const  TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          const   SizedBox(height: 100),
            Container(
              width: double.infinity,
              height: 65, // Ensure the button stretches to match the width of the screen
              padding:const  EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 143, 34, 246)),
                ),
                onPressed: () {
                  // Handle booking action
                },
                child: const Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
