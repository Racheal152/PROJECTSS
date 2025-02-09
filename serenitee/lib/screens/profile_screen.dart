import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../services/authentication_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _darkMode = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _loadUserData() async {
    var userDoc =
        await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
    if (userDoc.exists) {
      var userData = userDoc.data()!;
      _nameController.text = userData['name'];
      _emailController.text = userData['email'];
      setState(() {
        _darkMode = userData['darkMode'] ?? false;
      });
    }
  }

  Future<void> _saveUserData() async {
    if (_auth.currentUser != null) {
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'name': _nameController.text,
        'email': _emailController.text,
        'darkMode': _darkMode,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile and Settings")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_placeholder.png'),
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Implement profile picture change
                },
              ),
            ),
            CustomTextField(
              controller: _nameController,
              labelText: "Name",
            ),
            CustomTextField(
              controller: _emailController,
              labelText: "Email",
            ),
            SwitchListTile(
              title: Text("Dark Mode"),
              value: _darkMode,
              onChanged: (bool value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
            CustomButton(
              text: "Save",
              onPressed: _saveUserData,
            ),
            CustomButton(
              text: "Log Out",
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
