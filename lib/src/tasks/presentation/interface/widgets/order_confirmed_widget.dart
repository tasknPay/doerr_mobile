import 'package:flutter/material.dart';

class OrderConfirmedDialog extends StatelessWidget {
  const OrderConfirmedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Success Icon with Animation
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 80,
          ),
          SizedBox(height: 24),

          // Title
          Text(
            'Order Confirmed!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          // const SizedBox(height: 16),

          // // Message
          // const Text(
          //   'Your order has been successfully placed. Thank you!',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 16,
          //     color: Colors.grey,
          //   ),
          // ),
          // const SizedBox(height: 32),

          // // Close Button
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).pop(); // Close the dialog
          //   },
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.green,
          //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //   ),
          //   child: const Text(
          //     'Close',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
