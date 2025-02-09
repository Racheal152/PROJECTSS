import 'package:flutter/material.dart';
import 'package:pinkpay_app/screens/splash_screen.dart';
import 'package:pinkpay_app/screens/login_screen.dart';
import 'package:pinkpay_app/screens/forgot_password.dart';
import 'package:pinkpay_app/screens/signup_page.dart';
import 'package:pinkpay_app/screens/main_dashboard.dart';
import 'package:pinkpay_app/screens/home_page.dart';
import 'package:pinkpay_app/screens/pay_bills.dart';
import 'package:pinkpay_app/screens/send_money.dart';
import 'package:pinkpay_app/screens/withdraw.dart';
import 'package:pinkpay_app/screens/payment_confirmation_page.dart';

void main() {
  runApp(const PinkPayApp());
}

class PinkPayApp extends StatelessWidget {
  const PinkPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PinkPay',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/login': (context) => const LoginPage(),
        '/forgotPassword': (context) => ForgotPasswordPage(),
        '/signIn': (context) => const SignUpPage(),
        '/mainDashboard': (context) => const HomePageScreen(),
        '/homePage': (context) => const MyApp(),
        '/payBills': (context) => const PayBillsPage(),
        '/sendMoney': (context) => const SendMoneyPage(),
        '/withdraw': (context) => const WithdrawScreen(),
        '/paymentConfirmation': (context) => const PaymentConfirmationPage(
              biller: 'Racheal Me',
              amount: 100.0,
              paymentMethod: 'PayPal',
            ),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      body: Center(
        child: Text(
          'PinkPay',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/mainDashboard');
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgotPassword');
              },
              child: const Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Center(child: const Text('Forgot Password Screen')),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(child: const Text('Sign In Screen')),
    );
  }
}

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Dashboard')),
      body: Center(child: const Text('Main Dashboard Screen')),
    );
  }
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(child: const Text('Home Page Screen')),
    );
  }
}

class PayBillsScreen extends StatelessWidget {
  const PayBillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay Bills')),
      body: Center(child: const Text('Pay Bills Screen')),
    );
  }
}

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Money')),
      body: Center(child: const Text('Send Money Screen')),
    );
  }
}

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Withdraw Funds')),
      body: Center(child: const Text('Withdraw Funds Screen')),
    );
  }
}

class PaymentConfirmationScreen extends StatelessWidget {
  const PaymentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Confirmation')),
      body: Center(child: const Text('Payment Confirmation Screen')),
    );
  }
}
