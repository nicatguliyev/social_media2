import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.deepOrange],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or Image
              Image.asset(
                'assets/images/lion.png', // Replace with your logo image asset
                height: 100.0,
              ),
              SizedBox(height: 30.0),

              // Custom Username TextField
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Custom Password TextField
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Custom Login Button
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.orange],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login logic
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Register Button
              TextButton(
                onPressed: () {
                  // Navigate to registration page or perform other actions
                },
                child: Text(
                  'Don\'t have an account? Register here',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}