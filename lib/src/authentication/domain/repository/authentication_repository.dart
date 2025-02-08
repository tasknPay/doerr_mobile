import 'package:dartz/dartz.dart';

import '../../../../core/doer/domain/entities/doer.dart';
import '../../../../shared/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, Doer>> logout();
  Future<Either<Failure, Doer>> login(String email, String password);
  Future<bool> isLoggedIn();
}
