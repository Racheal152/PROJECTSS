import 'package:flutter/material.dart';
import 'package:pinkpay_app/screens/payment_confirmation_page.dart';

class PayBillsPage extends StatefulWidget {
  const PayBillsPage({super.key});

  @override
  _PayBillsPageState createState() => _PayBillsPageState();
}

class _PayBillsPageState extends State<PayBillsPage> {
  String biller = ''; // Store the selected biller.
  double amount = 0.0; // Store the bill payment amount.
  String paymentMethod = ''; // Store the selected payment method.

  // Function to confirm the bill payment.
  void _confirmPayment() {
    if (biller.isNotEmpty && amount > 0 && paymentMethod.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentConfirmationPage(
            biller: biller,
            amount: amount,
            paymentMethod: paymentMethod,
          ),
        ),
      );
    } else {
      // Show an error if any field is empty.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')),
      );
    }
  }

  // Function to handle amount input and validate it.
  void _handleAmountInput(String value) {
    setState(() {
      amount = double.tryParse(value) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay Bills')), // AppBar with page title.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content.
        child: Column(
          children: [
            // Biller input field
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Biller'), // Label for biller field.
              onChanged: (value) {
                setState(() {
                  biller = value; // Update biller name when text changes.
                });
              },
            ),
            const SizedBox(height: 16), // Spacer between input fields.

            // Amount input field
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Amount'), // Label for amount field.
              keyboardType: TextInputType.number, // Only allows numeric input.
              onChanged: _handleAmountInput, // Update amount if valid.
            ),
            const SizedBox(height: 16), // Spacer between input fields.

            // Payment method dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                  labelText: 'Payment Method'), // Label for the dropdown.
              value: paymentMethod.isEmpty
                  ? null
                  : paymentMethod, // Set initial value.
              items: const [
                // Dropdown items for payment methods.
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
                  paymentMethod =
                      value ?? ''; // Update selected payment method.
                });
              },
            ),
            const SizedBox(height: 16), // Spacer between input fields.

            // Proceed button to confirm payment
            ElevatedButton(
              onPressed: _confirmPayment, // Trigger confirmation when pressed.
              child: const Text('Proceed to Confirm'), // Button text.
            ),
          ],
        ),
      ),
    );
  }
}
