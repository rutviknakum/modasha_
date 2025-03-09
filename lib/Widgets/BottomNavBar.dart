import 'package:flutter/material.dart';
import 'package:demo_application/DashboardScreen.dart';
import 'package:demo_application/AboutUsPage.dart';
import 'package:demo_application/Quiz_Screen/QuizPage.dart';
import 'package:demo_application/ProfilePage.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required void Function(int index) onTap,
  }) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex)
      return; // Prevent reload if already on the same page

    Widget nextScreen;
    switch (index) {
      case 0:
        nextScreen = DashboardScreen();
        break;
      case 1:
        nextScreen = AboutUsPage();
        break;
      case 2:
        nextScreen = QuizPage();
        break;
      case 3:
        nextScreen = ProfilePage();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      selectedItemColor: Colors.green[700],
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true, // Show text for selected tab
      showUnselectedLabels: false, // Hide text for unselected
      onTap: (index) => _onItemTapped(context, index), // Handle navigation
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard), // Changed to match "Dashboard"
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info), // Changed to match "About Us"
          label: "About Us",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events, size: 32),
          label: "Quiz",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
