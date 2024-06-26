import 'package:flutter/material.dart';
import 'package:frontend/Onboarding_Screen.dart';
import 'package:frontend/flight_detail_page.dart';
import 'package:frontend/hotel_detail_page.dart';
import 'package:frontend/landing_page.dart';
import 'login.dart'; // Import the LoginPage
import 'signup.dart'; // Import the SignupPage


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
        '/landing_page': (context) => const LandingPage(),
        '/login': (context) => LoginPage(), // Define route for LoginPage
        '/signup': (context) => const SignupPage(), // Define route for SignupPage
        '/onboarding': (context) => const OnboardingScreen(), // Define route for OnboardingScreen
        '/hotel_detail': (context) => const HotelDetailPage(),
        '/flight_detail': (context) => const FlightDetailPage(),// Define route for DetailPage
      },
    );
  }
}
