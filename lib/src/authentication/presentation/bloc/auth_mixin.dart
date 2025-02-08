import 'package:doerr/src/onboarding/presentation/interface/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../../../shared/presentation/widgets/snackbar.dart';
import '../../../../shared/utils/navigation.dart';
import '../../../home/presentation/interface/screens/bottom_nav_bar.dart';
import 'auth_bloc.dart';

mixin AuthMixin {
  final bloc = sl<AuthBloc>();

  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final result = await bloc.loginUser(email, password);
      result.fold(
        (failure) {
          // Handle login failure
          SnackBarHelper.showErrorSnackBar(context, failure.message);
        },
        (leader) {
          // Handle successful login
          if (leader.token != null) {
            NavigationHelper.navigateToAndRemoveUntil(
                context, const BottomNavBar());
          } else {
            SnackBarHelper.showErrorSnackBar(
                context, 'Login failed: No token received');
          }
        },
      );
    } catch (e) {
      SnackBarHelper.showErrorSnackBar(
          context, 'An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<void> logoutUser({required BuildContext context}) async {
    final result = await bloc.logoutUser();
    return result.fold(
      (l) => SnackBarHelper.showErrorSnackBar(context, l.message),
      (r) {
        NavigationHelper.navigateToAndRemoveUntil(
            context, const OnboardingScreen());
      },
    );
  }
}
