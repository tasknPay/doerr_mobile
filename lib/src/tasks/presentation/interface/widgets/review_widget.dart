import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      children: [
        // Review Details Card
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.task_alt_outlined,
                    size: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Review Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                color: Colors.grey.shade200,
              ),
              const SizedBox(height: 12),
              _buildDetailItem(
                icon: IconlyLight.category,
                label: 'Type',
                value: 'Errands',
              ),
              const SizedBox(height: 20),
              _buildDetailItem(
                icon: IconlyLight.location,
                label: 'Location',
                value: 'Accra',
              ),
              const SizedBox(height: 20),
              _buildDetailItem(
                icon: IconlyLight.calendar,
                label: 'Deadline',
                value: '7th Jan 2025',
              ),
              const SizedBox(height: 20),
              _buildDetailItem(
                icon: IconlyLight.message,
                label: 'Email',
                value: 'asare@gmail.com',
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'GHS 15.00',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        Expanded(
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
