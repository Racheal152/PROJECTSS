import 'package:flutter/material.dart';

class WellnessTipsScreen extends StatelessWidget {
  final Map<String, List<String>> _tips = {
    "Nutrition": ["Stay hydrated.", "Eat a balanced diet."],
    "Exercise": ["Exercise regularly.", "Take short breaks to move around."],
    "Mental Health": ["Practice mindfulness.", "Get enough sleep."],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tips.keys.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wellness Tips"),
          bottom: TabBar(
            tabs: _tips.keys.map((category) => Tab(text: category)).toList(),
          ),
        ),
        body: TabBarView(
          children: _tips.values.map((tips) {
            return ListView.builder(
              itemCount: tips.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tips[index]),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
