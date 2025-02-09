import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.pinkAccent],
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black26,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Instructional text
                Text(
                  'Enter your email to reset your password.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),

                // Email input field
                FocusedTextField(emailController: emailController),
                SizedBox(height: 30),

                // Button to send verification code
                AnimatedButton(emailController: emailController),
                SizedBox(height: 20),

                // Navigate back to Sign In
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Navigate back to Sign In page
                  },
                  child: Text(
                    'Already have an account? Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FocusedTextField extends StatefulWidget {
  final TextEditingController emailController;

  const FocusedTextField({super.key, required this.emailController});

  @override
  _FocusedTextFieldState createState() => _FocusedTextFieldState();
}

class _FocusedTextFieldState extends State<FocusedTextField> {
  FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.emailController,
      focusNode: focusNode,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Enter your email',
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
              color: isFocused ? Colors.pinkAccent : Colors.white70, width: 2),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final TextEditingController emailController;

  const AnimatedButton({super.key, required this.emailController});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: isButtonPressed ? 55 : 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          String email = widget.emailController.text.trim();

          // Validate email
          if (email.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please enter a valid email')),
            );
          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Invalid email format')),
            );
          } else {
            setState(() {
              isButtonPressed = true;
            });

            // Simulate sending verification code
            Future.delayed(Duration(seconds: 2), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuccessPage()),
              );
            });
          }
        },
        child: Text(
          'Send Verification Code',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          'Verification code sent successfully!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
