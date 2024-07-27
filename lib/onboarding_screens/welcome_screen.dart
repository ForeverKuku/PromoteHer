import 'dart:async';

import 'package:flutter/material.dart';
import 'package:promote_her_app/onboarding_screens/app_detials_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void initState() {
    super.initState();
    // Delay navigation to the next screen by 10 seconds
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AppDetialScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 143, 34, 246), // Set the background color here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                      'assets/images/promote2.png',
                      width: 3500,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
            const Text(
              'Welcome to PromoteHer',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color on splash screen
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Promoter is an app with a mission to promote female participation in the tech and job markets. We aim to bridge the gender gap by creating and posting various job opportunities tailored to womens skills and aspirations.',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.black45,
              )
            ),
            const SizedBox(height: 80.0),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Color for the loading indicator
            ),
          ],
        ),
      ),
    );
  }
}
