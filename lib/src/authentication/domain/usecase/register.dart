import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/doer/domain/entities/doer.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../repository/authentication_repository.dart';

class Register implements UseCase<Doer, RegisterParams> {
  final AuthenticationRepository repository;
  Register(this.repository);
  @override
  Future<Either<Failure, Doer>> call(RegisterParams params) async {
    return await repository.register(Doer(
      name: params.name,
      email: params.email,
      phone: params.phone,
      password: params.password,
      token: null,
    ));
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String phone;
  final String name;

  const RegisterParams(
      {required this.email,
      required this.password,
      required this.phone,
      required this.name});

  @override
  List<Object> get props => [email, password, phone, name];
}
