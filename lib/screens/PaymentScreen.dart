import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Overview'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPaymentMethod('Google Pay', 'assets/images/googlepayimg.jpg'),
            _buildPaymentMethod('Amazon Pay', 'assets/images/amazonimg.jpg'),
            _buildPaymentMethod('Credit Card', 'assets/images/visaimg.jpg'),
            _buildPaymentMethod('PayPal', 'assets/images/paypalimg.jpg'),
            const Divider(height: 40),
            _buildPaymentRow('Sub-Total', '\$1300.00'),
            _buildPaymentRow('Shipping Fee', '\$15.00'),
            _buildPaymentRow('Total Payment', '\$1315.00', isTotal: true),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  ///////////////////////////////
                },
                child: const Text(
                  'Confirm Payment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String method, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_outline_rounded, size: 16, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                method,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
