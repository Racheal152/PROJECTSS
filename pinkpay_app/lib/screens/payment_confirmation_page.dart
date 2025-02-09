import 'package:flutter/material.dart';

class PaymentConfirmationPage extends StatelessWidget {
  final String biller;
  final double amount;
  final String paymentMethod;

  const PaymentConfirmationPage({
    super.key,
    required this.biller,
    required this.amount,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Confirm Payment')), // AppBar with title.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content.
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to left.
          children: [
            const Text('Payment Details',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold)), // Heading text.
            const SizedBox(height: 16), // Spacer between heading and content.
            Text('Biller: $biller',
                style: TextStyle(fontSize: 16)), // Display biller info.
            Text('Amount: \$${amount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 16)), // Display amount with two decimals.
            Text('Payment Method: $paymentMethod',
                style: TextStyle(fontSize: 16)), // Display payment method.
            const SizedBox(height: 20), // Spacer before buttons.

            // Confirm Button to process the payment
            ElevatedButton(
              onPressed: () {
                // Process the payment (e.g., send request to backend).
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Payment Successful')), // Success message.
                );
                // Optionally, add visual feedback like a loading spinner
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                });
              },
              child: const Text('Confirm Payment'), // Button text.
            ),
            const SizedBox(height: 10), // Spacer between buttons.

            // Cancel Button to go back to the Pay Bills page
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the Pay Bills page.
              },
              child: const Text('Cancel'), // Button text.
            ),
          ],
        ),
      ),
    );
  }
}
