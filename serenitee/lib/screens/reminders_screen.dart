import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../services/notification_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class RemindersScreen extends StatefulWidget {
  @override
  _RemindersScreenState createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final TextEditingController _reminderController = TextEditingController();
  final List<String> _reminders = [];
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);
    final notificationService = Provider.of<NotificationService>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Reminders")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _reminderController,
              labelText: "Reminder",
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                );
                if (pickedTime != null && pickedTime != _selectedTime) {
                  setState(() {
                    _selectedTime = pickedTime;
                  });
                  notificationService.scheduleReminder(
                    _reminderController.text,
                    "It's time to ${_reminderController.text}",
                    DateTime.now().add(Duration(
                        hours: _selectedTime.hour,
                        minutes: _selectedTime.minute)),
                  );
                }
              },
              child: Text("Pick Time"),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Add Reminder",
              onPressed: () async {
                if (_reminderController.text.isNotEmpty) {
                  final reminderText = _reminderController.text;
                  final reminderTime = TimeOfDay(
                    hour: _selectedTime.hour,
                    minute: _selectedTime.minute,
                  );

                  // Store reminder in Firestore
                  await firestoreService.addReminder(
                      reminderText, reminderTime);

                  // Schedule notification
                  notificationService.scheduleReminder(
                    reminderText,
                    "It's time to $reminderText",
                    reminderTime,
                  );

                  // Clear the input field
                  _reminderController.clear();
                }
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<List<Reminder>>(
                stream: firestoreService.remindersStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No reminders set"));
                  }

                  final reminders = snapshot.data!;
                  return ListView.builder(
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      final reminder = reminders[index];
                      return ListTile(
                        title: Text(reminder.text),
                        subtitle: Text(reminder.time.format(context)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await firestoreService.deleteReminder(reminder.id);
                          },
                        ),
                      );
                    },
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
