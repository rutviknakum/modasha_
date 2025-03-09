import 'package:demo_application/Quiz_Screen/Que1.dart';
import 'package:flutter/material.dart';
import 'package:demo_application/Widgets/BottomNavBar.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 2; // Set the correct index for QuizPage

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F1EB), // Background color

      appBar: AppBar(
        backgroundColor: Colors.transparent,

        elevation: 0,
        title: const Text("Quiz", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              const Text(
                "Ready to Test Your Knowledge?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Image Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset("assets/Quiz.png", fit: BoxFit.cover),
              ),

              const SizedBox(height: 16),

              // Info Cards
              Row(
                children: [
                  _infoCard(
                    Icons.info,
                    "Quiz Instructions",
                    "Answer these questions to learn how our products can help you reach your goals.",
                  ),
                  const SizedBox(width: 10),
                  _infoCard(Icons.access_time, "4 Questions", "Time: 3 mins"),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  _smallCard(Icons.eco, "Product Benefits"),
                  const SizedBox(width: 10),
                  _smallCard(Icons.info, "Fun Facts"),
                ],
              ),

              const SizedBox(height: 20),

              // Start Quiz Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Start Quiz Clicked");
                    //  Navigate to Quiz Questions Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Que1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Start Quiz",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  // Large Info Card Widget (No Tap)
  Widget _infoCard(IconData icon, String title, String subtitle) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.green[700], size: 28),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  // Small Card Widget (No Tap)
  Widget _smallCard(IconData icon, String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.green[700], size: 24),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
