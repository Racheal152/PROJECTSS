import 'package:flutter/material.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  String recipient = '';
  double amount = 0.0;
  String paymentMethod = '';

  void _confirmTransaction() {
    if (recipient.isNotEmpty && amount > 0 && paymentMethod.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransactionConfirmationPage(
            recipient: recipient,
            amount: amount,
            paymentMethod: paymentMethod,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Recipient input field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Recipient',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  recipient = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Amount input field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            const SizedBox(height: 16),

            // Payment method dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Payment Method',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              value: paymentMethod.isEmpty ? null : paymentMethod,
              items: const [
                DropdownMenuItem(
                  value: 'Bank Account',
                  child: Text('Bank Account'),
                ),
                DropdownMenuItem(
                  value: 'Mobile Wallet',
                  child: Text('Mobile Wallet'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  paymentMethod = value ?? '';
                });
              },
            ),
            const SizedBox(height: 16),

            // Proceed button
            ElevatedButton(
              onPressed: _confirmTransaction,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
              ),
              child: const Text('Proceed to Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionConfirmationPage extends StatelessWidget {
  final String recipient;
  final double amount;
  final String paymentMethod;

  const TransactionConfirmationPage({
    super.key,
    required this.recipient,
    required this.amount,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Transaction'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Transaction Details',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 16),
            Text('Recipient: $recipient',
                style: TextStyle(color: Colors.white)),
            Text('Amount: \$${amount.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white)),
            Text('Payment Method: $paymentMethod',
                style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Transaction Successful')),
                );
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
              ),
              child: const Text('Confirm and Send'),
            ),
            const SizedBox(height: 10),

            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
