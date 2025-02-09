import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class MoodTrackingScreen extends StatefulWidget {
  @override
  _MoodTrackingScreenState createState() => _MoodTrackingScreenState();
}

class _MoodTrackingScreenState extends State<MoodTrackingScreen> {
  final TextEditingController _noteController = TextEditingController();
  final List<Map<String, String>> _moodHistory = [];
  String _selectedMood = "Happy";

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Mood Tracking")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedMood,
              items: ["Happy", "Sad", "Angry", "Calm", "Anxious"]
                  .map((mood) => DropdownMenuItem(
                        value: mood,
                        child: Text(mood),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedMood = value!;
                });
              },
            ),
            CustomTextField(
              controller: _noteController,
              labelText: "Notes",
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Log Mood",
              onPressed: () {
                firestoreService.addJournalEntry(
                    "userId", _noteController.text);
                setState(() {
                  _moodHistory.add({
                    "mood": _selectedMood,
                    "note": _noteController.text,
                  });
                  _noteController.clear();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _moodHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_moodHistory[index]["mood"]!),
                    subtitle: Text(_moodHistory[index]["note"]!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
