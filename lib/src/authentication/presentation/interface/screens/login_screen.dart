import 'package:doerr/src/authentication/presentation/interface/screens/register_user_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/presentation/theme/extra_colors.dart';
import '../../../../../shared/presentation/widgets/app_button.dart';
import '../../../../../shared/presentation/widgets/constants/app_spacer.dart';
import '../../../../../shared/presentation/widgets/constants/app_text.dart';
import '../../../../../shared/utils/navigation.dart';
import '../../../../home/presentation/interface/screens/bottom_nav_bar.dart';
import '../widgets/or_divider.dart';
import '../widgets/social_circle_auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const AppText.medium('Log in with email',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const AppSpacer.vLarge(),
            const AppText.smaller('Email'),
            const AppSpacer.vShorter(),
            TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1),
                    ),
                    hintText: 'doerr@gmail.com')),
            const AppSpacer.vLarge(),
            const AppText.smaller('Enter password'),
            const AppSpacer.vShorter(),
            TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1),
                    ),
                    hintText: 'Password')),
            const AppSpacer.vLarger(),
            AppButton(
              height: 45,
              borderRadius: 10,
              backgroundColor: ExtraColors.customGreen,
              text: 'Log in',
              textColor: ExtraColors.white,
              padding: const EdgeInsets.all(0),
              onTap: () {
                NavigationHelper.navigateToReplacement(
                    context, const BottomNavBar());
              },
            ),
            const AppSpacer.vLarge(),
            const OrDivider(
              text: 'OR',
              thickness: 0.3,
              color: ExtraColors.darkGrey,
            ),
            const AppSpacer.vLarge(),
            const Center(child: AppText.smaller('Log in with')),
            const AppSpacer.vShort(),
            SocialCircleLoginButtons(
              size: 50,
              borderColor: Colors.grey.shade300,
              backgroundColor: Colors.white,
              iconColor: Colors.black,
              onGoogleTap: () {},
              onFacebookTap: () {},
              onAppleTap: () {},
            ),
            const AppSpacer.vLarger(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppText.smaller('Don\'t have an account?',
                    color: ExtraColors.darkGrey),
                const AppSpacer.hShorter(),
                GestureDetector(
                  onTap: () {
                    NavigationHelper.navigateTo(
                        context, const RegisterUserScreen());
                  },
                  child: const AppText.smaller(
                    'Sign up',
                    style: TextStyle(
                        color: ExtraColors.link, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
