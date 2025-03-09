import 'package:demo_application/HealthProfileScreen1.dart';
import 'package:flutter/material.dart';

class HealthProfileScreen extends StatefulWidget {
  @override
  _HealthProfileScreenState createState() => _HealthProfileScreenState();
}

class _HealthProfileScreenState extends State<HealthProfileScreen> {
  int _selectedGoalIndex = -1; // -1 means no goal is selected

  void _onGoalSelected(int index) {
    setState(() {
      _selectedGoalIndex = index;
    });

    // Navigate to a new screen when a goal is selected
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => HealthProfileScreen1(
              goal: index == 0 ? "Lose Weight" : "Get Fitter",
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 90),
            const SizedBox(height: 20),
            const Text(
              "Health Profile",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1, color: Colors.black12),
            const SizedBox(height: 20),
            const Text(
              "What’s your goal?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 100),

            // Goal Cards with Tap Gesture
            GestureDetector(
              onTap: () => _onGoalSelected(0),
              child: GoalCard(
                title: "Lose Weight",
                subtitle: "Burn fat & get lean",
                icon: Icons.local_fire_department,
                isSelected: _selectedGoalIndex == 0,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _onGoalSelected(1),
              child: GoalCard(
                title: "Get Fitter",
                subtitle: "Tone up & feel healthy",
                icon: Icons.flash_on,
                isSelected: _selectedGoalIndex == 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Goal Card Widget
class GoalCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;

  GoalCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300), // Smooth transition effect
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            isSelected
                ? Colors.black
                : Colors.grey[300], // Change color on selection
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.white70 : Colors.black54,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: isSelected ? Colors.red : Colors.yellow),
          ),
        ],
      ),
    );
  }
}
