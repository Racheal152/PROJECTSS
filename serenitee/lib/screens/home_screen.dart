import 'package:flutter/material.dart';
import 'mood_tracking_screen.dart';
import 'wellness_tips_screen.dart';
import 'reminders_screen.dart';
import 'profile_screen.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomCard(
              title: "Mood Tracker",
              subtitle: "Log your mood and view trends.",
              icon: Icons.mood,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoodTrackingScreen()),
                );
              },
            ),
            CustomCard(
              title: "Wellness Tips",
              subtitle: "Get personalized wellness tips.",
              icon: Icons.lightbulb,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WellnessTipsScreen()),
                );
              },
            ),
            CustomCard(
              title: "Reminders",
              subtitle: "Set and manage reminders.",
              icon: Icons.notifications,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RemindersScreen()),
                );
              },
            ),
            CustomCard(
              title: "Profile",
              subtitle: "Manage your profile and settings.",
              icon: Icons.person,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
