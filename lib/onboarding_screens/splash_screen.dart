import 'dart:async';

import 'package:flutter/material.dart';
import 'package:promote_her_app/onboarding_screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
 void initState() {
    super.initState();
    // Delay navigation to the next screen by 10 seconds
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>const  WelcomeScreen()),
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
                      'assets/images/logo.png',
                      width: 3500,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
            const Text(
              'PromoteHer App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color on splash screen
              ),
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
