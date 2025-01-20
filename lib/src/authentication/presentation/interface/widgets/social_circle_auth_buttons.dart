import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialCircleLoginButtons extends StatelessWidget {
  final double size;
  final Color borderColor;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onAppleTap;

  const SocialCircleLoginButtons({
    super.key,
    this.size = 50,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.onGoogleTap,
    this.onFacebookTap,
    this.onAppleTap,
  });

  Widget _buildSocialButton(IconData icon, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: FaIcon(
            icon,
            color: iconColor,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSocialButton(FontAwesomeIcons.google, onGoogleTap),
        const SizedBox(width: 16),
        _buildSocialButton(FontAwesomeIcons.facebook, onFacebookTap),
        const SizedBox(width: 16),
        _buildSocialButton(FontAwesomeIcons.apple, onAppleTap),
      ],
    );
  }
}
