import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../shared/presentation/widgets/constants/app_text.dart';

enum SocialAuthProvider { google, facebook, apple, email, guest, none }

class SocialAuthButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final SocialAuthProvider provider;
  final bool hasBorder;
  final Color? borderColor;
  final Color? iconColor;
  final double? height;

  const SocialAuthButton({
    super.key,
    this.onTap,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.contentPadding,
    this.provider = SocialAuthProvider.none,
    this.hasBorder = false,
    this.borderColor,
    this.iconColor,
    this.height,
  });

  Widget _getSocialIcon() {
    final color = iconColor ?? textColor ?? Colors.black87;
    const double iconSize = 20;

    switch (provider) {
      case SocialAuthProvider.google:
        return FaIcon(
          FontAwesomeIcons.google,
          size: iconSize,
          color: color,
        );
      case SocialAuthProvider.facebook:
        return FaIcon(
          FontAwesomeIcons.facebook,
          size: iconSize,
          color: color,
        );
      case SocialAuthProvider.apple:
        return FaIcon(
          FontAwesomeIcons.apple,
          size: iconSize,
          color: color,
        );
      case SocialAuthProvider.email:
        return FaIcon(
          FontAwesomeIcons.envelope,
          size: iconSize,
          color: color,
        );
      case SocialAuthProvider.guest:
        return FaIcon(
          FontAwesomeIcons.users,
          size: iconSize,
          color: color,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 0, right: 0, top: 16),
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: Material(
            color: backgroundColor ?? Colors.white,
            shape: StadiumBorder(
              side: hasBorder
                  ? BorderSide(
                      color: borderColor ?? Colors.grey.shade300,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            child: InkWell(
              onTap: onTap,
              customBorder: const StadiumBorder(),
              child: Padding(
                padding:
                    contentPadding ?? const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getSocialIcon(),
                    if (provider != SocialAuthProvider.none)
                      const SizedBox(width: 12),
                    AppText.smaller(
                      text ?? _getDefaultText(),
                      color: textColor ?? Colors.black87,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getDefaultText() {
    switch (provider) {
      case SocialAuthProvider.google:
        return 'Continue with Google';
      case SocialAuthProvider.facebook:
        return 'Continue with Facebook';
      case SocialAuthProvider.apple:
        return 'Continue with Apple';
      case SocialAuthProvider.email:
        return 'Continue with Email';
      case SocialAuthProvider.guest:
        return 'Continue as Guest';
      default:
        return 'Continue';
    }
  }
}
