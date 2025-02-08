import 'package:get_it/get_it.dart';

import 'data/database/auth_local_database.dart';
import 'data/database/authentication_remote_database.dart';
import 'data/repository_impl/authentication_repository_impl.dart';
import 'domain/repository/authentication_repository.dart';
import 'domain/usecase/login.dart';
import 'domain/usecase/logout.dart';
import 'domain/usecase/register.dart';
import 'presentation/bloc/auth_bloc.dart';

void initAuth() {
  final sl = GetIt.instance;

  sl.registerFactory(() => AuthBloc(login: sl(), logout: sl(), register: sl()));

  sl.registerLazySingleton<AuthLocalDatabase>(() => AuthLocalDatabaseImpl());
  sl.registerLazySingleton<AuthenticationRemoteDatabase>(
      () => AuthenticationRemoteDatabaseImpl());

  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          networkInfo: sl(), remoteDatabase: sl(), localDatabase: sl()));

  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Register(sl()));
}
