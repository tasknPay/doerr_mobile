import 'package:doerr/src/home/presentation/interface/screens/bottom_nav_bar.dart';
import 'package:doerr/src/onboarding/presentation/interface/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'src/authentication/domain/repository/authentication_repository.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final AuthenticationRepository authRepository =
      sl<AuthenticationRepository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: authRepository.isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }

        if (snapshot.data == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavBar()),
              (Route<dynamic> route) => false,
            );
          });
          return const SizedBox.shrink();
        }

        return const OnboardingScreen();
      },
    );
  }
}
