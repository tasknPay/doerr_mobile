import 'package:dartz/dartz.dart';

import '../../../../core/doer/domain/entities/doer.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../repository/authentication_repository.dart';

class Logout implements UseCase<Doer, NoParams> {
  AuthenticationRepository repository;

  Logout(this.repository);

  @override
  Future<Either<Failure, Doer>> call(NoParams params) {
    return repository.logout();
  }
}
