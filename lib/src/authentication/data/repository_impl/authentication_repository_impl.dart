import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/doer/domain/entities/doer.dart';
import '../../../../shared/error/exception.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/platform/network_info.dart';
import '../../domain/repository/authentication_repository.dart';
import '../database/auth_local_database.dart';
import '../database/authentication_remote_database.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkInfo networkInfo;
  final AuthenticationRemoteDatabase remoteDatabase;
  final AuthLocalDatabase localDatabase;

  AuthenticationRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatabase,
    required this.localDatabase,
  });

  @override
  Future<Either<Failure, Doer>> login(String email, String password) async {
    try {
      await networkInfo.hasInternet();
      final doer = await remoteDatabase.login(email, password);
      if (doer.token != null) {
        await localDatabase.saveToken(doer.token!);
      }
      return Right(doer);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Doer>> logout() async {
    try {
      await networkInfo.hasInternet();
      await remoteDatabase.logout();
      await localDatabase.clearAllData();
      return Right(Doer.initial());
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    } catch (error) {
      log(error.toString());
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await localDatabase.getToken();
    if (token == null) return false;
    return await checkAuthentication(token);
  }

  Future<bool> checkAuthentication(String token) async {
    try {
      final isValid = await remoteDatabase.validateToken(token);
      if (!isValid) {
        await localDatabase.removeToken();
      }
      return isValid;
    } catch (e) {
      await localDatabase.removeToken();
      return false;
    }
  }
}
