import 'package:doerr/shared/presentation/theme/extra_colors.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final double thickness;
  final Color color;

  const OrDivider({
    super.key,
    this.text = 'OR',
    this.thickness = 1.0,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: thickness,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: const TextStyle(
              color: ExtraColors.darkGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: thickness,
            color: color,
          ),
        ),
      ],
    );
  }
}
