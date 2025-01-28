import 'package:doerr/shared/presentation/widgets/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({super.key});

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  String? selectedPaymentMethod;
  String? selectedNetwork;
  final momoController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  final cardNameController = TextEditingController();

  final networks = [
    {'name': 'MTN Mobile Money', 'image': 'assets/mtn.png'},
    {'name': 'Vodafone Cash', 'image': 'assets/vodafone.png'},
    {'name': 'AirtelTigo Money', 'image': 'assets/airteltigo.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16).copyWith(top: 0, left: 16, right: 16),
      children: [
        Container(
          // padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.05),
            //     blurRadius: 10,
            //     offset: const Offset(0, 2),
            //   ),
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText.small(
                'Select Payment Method',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              // Mobile Money Option
              _buildPaymentOption(
                title: 'Mobile Money',
                subtitle: 'Pay with Mobile Money',
                imageUrl: 'https://ghipss.net/images/mmi-4.jpg',
                value: 'momo',
              ),

              if (selectedPaymentMethod == 'momo') ...[
                const SizedBox(height: 20),
                // Network Selection
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: networks
                      .map((network) => GestureDetector(
                            onTap: () => setState(
                                () => selectedNetwork = network['name']),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedNetwork == network['name']
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade300,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                network['name']!,
                                style: TextStyle(
                                  color: selectedNetwork == network['name']
                                      ? Theme.of(context).primaryColor
                                      : Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),

                const SizedBox(height: 20),
                // Mobile Money Number Input
                TextFormField(
                  controller: momoController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Mobile Money Number',
                    hintText: '0XX XXX XXXX',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(width: 0.8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 0.8, color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          width: 0.8, color: Theme.of(context).primaryColor),
                    ),
                    prefixIcon: const Icon(IconlyLight.call),
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // Card Payment Option
              _buildPaymentOption(
                title: 'Card Payment',
                subtitle: 'Pay with Visa or Mastercard',
                imageUrl:
                    'https://read.cardtonic.com/wp-content/uploads/2024/02/Cardtonic-dollar-Card.png',
                value: 'card',
              ),

              if (selectedPaymentMethod == 'card') ...[
                const SizedBox(height: 20),
                // Card Details Form
                TextField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(IconlyLight.wallet),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: expiryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          hintText: 'MM/YY',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          hintText: 'XXX',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: cardNameController,
                  decoration: InputDecoration(
                    labelText: 'Cardholder Name',
                    hintText: 'Enter name on card',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(IconlyLight.profile),
                  ),
                ),
              ],
            ],
          ),
        ),

        // const SizedBox(height: 24),
        // // Payment Summary
        // Container(
        //   padding: const EdgeInsets.all(24),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(16),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black.withOpacity(0.05),
        //         blurRadius: 10,
        //         offset: const Offset(0, 2),
        //       ),
        //     ],
        //   ),
        //   child: Column(
        //     children: [
        //       const Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             'Total Amount',
        //             style: TextStyle(
        //               fontSize: 16,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //           Text(
        //             'GHS 15.00',
        //             style: TextStyle(
        //               fontSize: 18,
        //               fontWeight: FontWeight.w600,
        //               color: Colors.green,
        //             ),
        //           ),
        //         ],
        //       ),
        //       const SizedBox(height: 24),
        //       SizedBox(
        //         width: double.infinity,
        //         height: 56,
        //         child: ElevatedButton(
        //           onPressed: () {
        //             // Handle payment
        //           },
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: Colors.green,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(12),
        //             ),
        //           ),
        //           child: const Text(
        //             'Pay Now',
        //             style: TextStyle(
        //               fontSize: 16,
        //               fontWeight: FontWeight.w600,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required String subtitle,
    required String imageUrl, // Change this from IconData to String
    required String value,
  }) {
    return InkWell(
      onTap: () => setState(() => selectedPaymentMethod = value),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedPaymentMethod == value
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey[200],
              child: ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 44, // 2 * radius
                  height: 44, // 2 * radius
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 20,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 0.8,
              child: Radio(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                value: value,
                groupValue: selectedPaymentMethod,
                onChanged: (value) =>
                    setState(() => selectedPaymentMethod = value),
                activeColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
