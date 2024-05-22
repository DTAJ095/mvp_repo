import 'package:flutter/material.dart';
import 'dart:ui';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Blurred header
                _buildHeader(),
                const SizedBox(height: 55.0), // Adjust spacing
                // Intro section
                _buildIntroSection(),
                const SizedBox(
                    height:
                        20.0), // Add space between intro section and next content
                // Onboarding pages
                ExploreAfricaPage(),
                BookWithEasePage(),
                StayWithAfricaPage(),
                const SizedBox(
                    height: 20.0), // Add space between content and footer
                _buildButtonRow(context),
                const SizedBox(
                    height: 20.0), // Add space between button row and footer
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.5),
          ],
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to AfricaStay',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Discover the Beauty of Africa, One Stay at a Time',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
            child: const Text(
              'Our project, AfricaStay, is focused on making it easier for people across Africa to book flights. We want to break down barriers and make travel within the continent as seamless as possible.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 80.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Set font weight to bold
                      )),
                ),
                const SizedBox(width: 20.0),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text('Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Set font weight to bold
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.10),
            Colors.black.withOpacity(0.5),
          ],
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '© 2024 Africa Stay. All Rights Reserved.',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'Powered by ALX Africa',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExploreAfricaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const OnboardingPage(
      title: 'Explore Africa',
      description: 'Discover and book flights and hotels across Africa.',
      imagePath: 'assets/images/african_safari.jpg',
    );
  }
}

class BookWithEasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const OnboardingPage(
      title: 'Book with Ease',
      description: 'Enjoy seamless booking experience with our app.',
      imagePath: 'assets/images/booking_app.jpg',
      alignRight: true,
    );
  }
}

class StayWithAfricaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const OnboardingPage(
      title: 'Stay with Africa-Grow with Africa.',
      description: 'Experience the beauty of Africa.',
      imagePath: 'assets/images/love.png',
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool alignRight;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    this.alignRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2), // Adjust opacity
                  Colors.black.withOpacity(0.5), // Adjust opacity
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!alignRight) // Image on the left, text on the right
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 20.0),
                Expanded(
                  flex: alignRight ? 3 : 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (alignRight) // Image on the right, text on the left
                  const SizedBox(width: 20.0),
                if (alignRight)
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
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
