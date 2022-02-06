import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sociocredz/presentation/screens/main/explore_screen.dart';
import 'package:sociocredz/presentation/screens/main/home_screen.dart';
import 'package:sociocredz/presentation/screens/main/profile_screen.dart';
import 'package:sociocredz/presentation/screens/main/stats_screen.dart';
import 'package:sociocredz/presentation/themes/theme.dart';

class ContainerScreen extends StatefulWidget {
  @override
  _ContainerScreenState createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    ExploreScreen(),
    StatsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Material(
        color: Colors.transparent,
        elevation: 70,
        child: Container(
          padding: EdgeInsets.only(bottom: 16),
          child: FloatingNavbar(
            onTap: (int val) {
              setState(() {
                _selectedIndex = val;
              });
            },
            backgroundColor: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.black,
            selectedItemColor: red,
            iconSize: 28,
            items: [
              FloatingNavbarItem(icon: Icons.home, title: 'Home'),
              FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
              FloatingNavbarItem(icon: Icons.leaderboard, title: 'Stats'),
              FloatingNavbarItem(icon: Icons.account_circle, title: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
