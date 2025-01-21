import 'package:doerr/shared/presentation/theme/extra_colors.dart';
import 'package:doerr/shared/presentation/widgets/app_button.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_text.dart';
import 'package:doerr/src/authentication/presentation/interface/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/navigation.dart';
import '../widgets/or_divider.dart';
import '../widgets/social_circle_auth_buttons.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const AppText.medium('Sign up with email',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const AppSpacer.vLarge(),
              const AppText.smaller('Username'),
              const AppSpacer.vShorter(),
              TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1),
                      ),
                      hintText: 'Name')),
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
              const AppText.smaller('Create a password'),
              const AppSpacer.vShorter(),
              TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1),
                      ),
                      hintText: 'Password')),
              const AppSpacer.vLarge(),
              const AppText.smaller('Confirm password'),
              const AppSpacer.vShorter(),
              TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1),
                      ),
                      hintText: 'Enter password again')),
              const AppSpacer.vLarger(),
              const AppButton(
                height: 45,
                borderRadius: 10,
                backgroundColor: ExtraColors.customGreen,
                text: 'Register',
                textColor: ExtraColors.white,
                padding: EdgeInsets.all(0),
              ),
              const AppSpacer.vLarge(),
              const OrDivider(
                text: 'OR',
                thickness: 0.3,
                color: ExtraColors.darkGrey,
              ),
              const AppSpacer.vLarge(),
              const Center(child: AppText.smaller('Sign up with')),
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
                  const AppText.smaller('Already have an account?',
                      color: ExtraColors.darkGrey),
                  const AppSpacer.hShorter(),
                  GestureDetector(
                    onTap: () {
                      NavigationHelper.navigateTo(context, const LoginScreen());
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
      ),
    );
  }
}
