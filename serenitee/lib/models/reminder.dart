import 'package:flutter/material.dart';

class Reminder {
  final String id;
  final String text;
  final TimeOfDay time;

  Reminder({
    required this.id,
    required this.text,
    required this.time,
  });

  factory Reminder.fromFirestore(Map<String, dynamic> data, String id) {
    return Reminder(
      id: id,
      text: data['text'],
      time: TimeOfDay(
        hour: int.parse(data['time'].split(":")[0]),
        minute: int.parse(data['time'].split(":")[1]),
      ),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'text': text,
      'time': "${time.hour}:${time.minute}",
    };
  }
}
