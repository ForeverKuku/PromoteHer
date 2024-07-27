import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:promote_her_app/network/auth_service.dart';
import 'package:promote_her_app/registration_screens/create_account_screen.dart';
import 'package:promote_her_app/registration_screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Email validation method
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validation method
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  // Method to submit the login form
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Validate the form
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      // Attempt login
      final message = await AuthService().login(email: email, password: password);

     
      // Handle login success or failure
     if (message == 'Login Successful') {
       print('Navigating to HomeScreen'); // Debugging print statement
       
    // Navigate to HomeScreen on successful login
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>  HomeScreen(),
      ),
    );
      } else {
        // Display error message using Snackbar if login fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message ?? 'An error occurred')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 80),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Email input field
              SizedBox(
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                  ),
                  validator: _validateEmail,
                ),
              ),
              const SizedBox(height: 20),
              // Password input field
              SizedBox(
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: _validatePassword,
                ),
              ),
              const SizedBox(height: 20),
              // Login button
              ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 143, 34, 246),
                  ),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              // Forgot password button
              SizedBox(
                height: 65,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // Add functionality for password recovery
                  },
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 20, 48, 74),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Social media login icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/apple.jpeg',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/google.jpeg',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/facebook.jpg',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Create Account button
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountScreen(),
                    ),
                  );
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
