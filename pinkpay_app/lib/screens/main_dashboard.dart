import 'package:flutter/material.dart';
import 'send_money.dart'; // Importing the SendMoneyPage for navigation.
import 'pay_bills.dart'; // Importing the PayBillsPage for navigation.
import 'withdraw.dart'; // Importing the WithdrawScreen for navigation.

void main() {
  runApp(const HomePageScreen());
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFDFF), // Background color
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section
              const SizedBox(height: 20),
              const Text(
                'Good Morning,',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
              const Text(
                'Racheal!',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                  shadows: [
                    Shadow(
                      blurRadius: 15,
                      color: Colors.pinkAccent,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Account Balance Card Section
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEE7E80), Color(0xFF935F7B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Racheal Kache',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'OverBridge Expert',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '4756 •••• •••• 9018',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '\$46,755.52',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'VISA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Action Buttons Section (Sending Money, Paying Bills, Withdraw)
              Flexible(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: screenWidth > 600 ? 4 : 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _buildMenuItem(
                      Icons.account_balance_wallet,
                      'Account\nand Card',
                      () {},
                    ),
                    _buildMenuItem(
                      Icons.swap_horiz,
                      'Transfer',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SendMoneyPage()),
                        );
                      },
                    ),
                    _buildMenuItem(
                      Icons.attach_money,
                      'Withdraw',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WithdrawScreen()),
                        );
                      },
                    ),
                    _buildMenuItem(
                      Icons.phone_android,
                      'Mobile\nRecharge',
                      () {},
                    ),
                    _buildMenuItem(
                      Icons.receipt,
                      'Pay the Bill',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PayBillsPage()),
                        );
                      },
                    ),
                    _buildMenuItem(
                      Icons.credit_card,
                      'Credit Card',
                      () {},
                    ),
                    _buildMenuItem(
                      Icons.insert_chart,
                      'Transaction\nReport',
                      () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
        color: Colors.pinkAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.pinkAccent.withOpacity(0.3),
              child: Icon(
                icon,
                color: Colors.pinkAccent,
                size: 15,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
