import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addJournalEntry(String userId, String entry) async {
    try {
      await _db.collection('users').doc(userId).collection('journal').add({
        'entry': entry,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addReminder(
      String userId, String reminder, DateTime time) async {
    try {
      await _db.collection('users').doc(userId).collection('reminders').add({
        'reminder': reminder,
        'time': time,
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Map<String, dynamic>>> getJournalEntries(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .collection('journal')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Stream<List<Map<String, dynamic>>> getReminders(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .collection('reminders')
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}
