import 'package:flutter/material.dart';
import 'package:promote_her_app/registration_screens/signin_screen.dart';

class AppDetialScreen extends StatelessWidget {
  const AppDetialScreen({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 143, 34, 246),
        height: double.infinity, // Set height to fill available space
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Image.asset(
                 'assets/images/promote1.png',
                      width: 3500,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                const SizedBox(height: 60),
                const Center(
                  child: Text(
                    'Our Services',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Center(
                  child: Text(
                    "Our platform serves as a comprehensive resource where users can find job listings that align with their expertise and career goals.By providing access to a wide range of employment options, aPromoter empowers women to take the next step in their professional journeys. We understand the challenges women face in these industries and are dedicated to fostering an inclusive environment where they can thrive. Users can browse through numerous job postings, each carefully selected to ensure it matches their skill set and interests.",
                    style: TextStyle(fontSize: 16.0, color: Colors.black45),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInScreen()),
                    ); // Navigate to LoginScreen
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 50)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Go to Login',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 143, 34, 246)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
