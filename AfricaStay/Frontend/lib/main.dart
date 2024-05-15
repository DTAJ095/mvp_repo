// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:login_background/Onboarding_Screen.dart';
import 'package:login_background/landing_page.dart';
import 'login.dart'; // Import the LoginPage
import 'signup.dart'; // Import the SignupPage
// Import the OnboardingScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Africa Stay',
      initialRoute: '/onboarding', // Set initial route to OnboardingScreen
      routes: {
        '/landing_page': (context) => LandingPage(),
        '/login': (context) => LoginPage(), // Define route for LoginPage
        '/signup': (context) => SignupPage(), // Define route for SignupPage
        '/onboarding': (context) =>
            OnboardingScreen(), // Define route for OnboardingScreen
      },
    );
  }
}