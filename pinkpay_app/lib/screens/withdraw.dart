import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController amountController = TextEditingController();
  String selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw Funds'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter amount to withdraw',
                prefixText: '\$',
              ),
            ),
            const SizedBox(height: 16),

            // Payment Method Dropdown
            const Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value:
                  selectedPaymentMethod.isEmpty ? null : selectedPaymentMethod,
              items: const [
                DropdownMenuItem(value: 'Bank', child: Text('Bank Transfer')),
                DropdownMenuItem(value: 'Mpesa', child: Text('Mpesa')),
                DropdownMenuItem(value: 'PayPal', child: Text('PayPal')),
                DropdownMenuItem(value: 'Stripe', child: Text('Stripe')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value ?? '';
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select a method',
              ),
            ),
            const SizedBox(height: 24),

            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final String amount = amountController.text.trim();

                  // Validate amount and payment method
                  if (amount.isEmpty || double.tryParse(amount) == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter a valid amount')),
                    );
                  } else if (selectedPaymentMethod.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please select a payment method')),
                    );
                  } else {
                    // Handle the withdrawal process (this can be your logic for withdrawing)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Processing withdrawal of \$$amount via $selectedPaymentMethod'),
                      ),
                    );
                    // Add your withdrawal logic here
                  }
                },
                child: const Text('Confirm Withdrawal'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
