import 'dart:developer';

import 'package:doerr/shared/presentation/theme/extra_colors.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_sizes.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_text.dart';
import 'package:doerr/shared/utils/navigation.dart';
import 'package:doerr/src/authentication/presentation/interface/screens/login_screen.dart';
import 'package:doerr/src/authentication/presentation/interface/screens/register_user_screen.dart';
import 'package:flutter/material.dart';

import '../../../../authentication/presentation/interface/widgets/socaial_auth_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExtraColors.lightGrey,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height * 0.41,
            child: Image.asset(
              height: MediaQuery.of(context).size.height * 0.3,
              'assets/images/onboarding_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.56,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 30),
            margin:
                const EdgeInsets.symmetric(horizontal: AppSizes.marginMedium),
            decoration: const BoxDecoration(
              color: ExtraColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText.large('Join Doerr', color: Colors.black87),
                const AppSpacer.vShorter(),
                const AppText.smaller(
                  'Create an account to find thousands\nof doerrs, available for a quick job.',
                  style: TextStyle(height: 1.2, color: ExtraColors.darkGrey),
                ),
                const AppSpacer.vShort(),
                SocialAuthButton(
                  onTap: () {
                    log('Email Sign In Button');
                  },
                  text: 'Sign up with Google',
                  provider: SocialAuthProvider.google,
                  backgroundColor: Colors.white,
                  textColor: Colors.black87, height: 45, // Specific height
                ),
// Facebook Sign In Button
                SocialAuthButton(
                  onTap: () {
                    log('Email Sign In Button');
                  },
                  text: 'Sign up with Facebook',
                  provider: SocialAuthProvider.facebook,
                  backgroundColor: const Color(0xFF1877F2),
                  textColor: Colors.white, height: 45, // Specific height
                ),
// Apple Sign In Button
                SocialAuthButton(
                  onTap: () {
                    log('Email Sign In Button');
                  },
                  text: 'Sign up with Apple',
                  provider: SocialAuthProvider.apple,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  height: 45, // Specific height
                ),
                // Email Sign In Button
                SocialAuthButton(
                  onTap: () {
                    NavigationHelper.navigateTo(
                        context, const RegisterUserScreen());
                  },
                  text: 'Sign up with Email',
                  provider: SocialAuthProvider.email,
                  hasBorder: true,
                  height: 45,
                  backgroundColor: Colors.white,
                  textColor: Colors.black87,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText.smaller('Already have an account?',
                        color: ExtraColors.darkGrey),
                    const AppSpacer.hShorter(),
                    GestureDetector(
                      onTap: () {
                        NavigationHelper.navigateTo(
                            context, const LoginScreen());
                      },
                      child: const AppText.smaller(
                        'Log in',
                        color: ExtraColors.link,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
