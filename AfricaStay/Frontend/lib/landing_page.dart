import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_background/account_page.dart';
import 'package:login_background/flight_page.dart';
import 'package:login_background/hotel_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  setCurrentPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HotelPage(),
        FlightPage(),
        AccountPage(),
      ][_currentIndex],
      bottomNavigationBar: navigationBar(),
    );
  }
  Widget navigationBar() {
    return ClipRect(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setCurrentPage(index),
            selectedItemColor: Colors.blue,
            selectedFontSize: 15,
            unselectedItemColor: Colors.grey,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.bed_double_fill,
                  size: 25,
                ),
                label: 'Hotels',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.airplane,
                  size: 25,
                ),
                label: 'Flights',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_rounded,
                  size: 25,
                ),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

