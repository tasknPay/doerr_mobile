import 'package:doerr/shared/presentation/widgets/constants/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/presentation/theme/extra_colors.dart';

class InterestChip extends StatelessWidget {
  final String label;
  const InterestChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      label: AppText.smaller(
        padding: const EdgeInsets.all(0),
        label,
        size: 12,
      ),
      labelStyle: const TextStyle(color: ExtraColors.darkGrey),
      backgroundColor: Colors.transparent,
      side: BorderSide(color: ExtraColors.darkGrey.withOpacity(0.5)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
