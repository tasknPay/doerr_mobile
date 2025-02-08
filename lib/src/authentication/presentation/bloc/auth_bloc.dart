import 'package:dartz/dartz.dart';

import '../../../../core/doer/domain/entities/doer.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../../domain/usecase/login.dart';
import '../../domain/usecase/logout.dart';

class AuthBloc {
  final Login login;
  final Logout logout;

  AuthBloc({
    required this.login,
    required this.logout,
  });

  Future<Either<Failure, Doer>> loginUser(String email, String password) async {
    return await login(LoginParams(email: email, password: password));
  }

  Future<Either<Failure, Doer>> logoutUser() async {
    return await logout(NoParams());
  }
}
