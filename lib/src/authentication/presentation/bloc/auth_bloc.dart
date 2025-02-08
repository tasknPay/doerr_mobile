import 'package:dartz/dartz.dart';
import 'package:doerr/src/authentication/domain/usecase/register.dart';

import '../../../../core/doer/domain/entities/doer.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../../domain/usecase/login.dart';
import '../../domain/usecase/logout.dart';

class AuthBloc {
  final Login login;
  final Logout logout;
  final Register register;

  AuthBloc({
    required this.login,
    required this.logout,
    required this.register,
  });

  Future<Either<Failure, Doer>> loginUser(String email, String password) async {
    return await login(LoginParams(email: email, password: password));
  }

  Future<Either<Failure, Doer>> logoutUser() async {
    return await logout(NoParams());
  }

  Future<Either<Failure, Doer>> registerUser(Doer doer) async {
    return await register(RegisterParams(
      name: doer.name,
      email: doer.email,
      phone: doer.phone,
      password: doer.password!,
    ));
  }
}
