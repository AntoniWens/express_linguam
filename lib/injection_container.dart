import 'package:express_lingua/data/db/database.dart';
import 'package:express_lingua/data/repository/otp_repository_impl.dart';
import 'package:express_lingua/domain/repository/otp_repository.dart';
import 'package:express_lingua/domain/usecase/otp/otp_use_case.dart';
import 'package:express_lingua/domain/usecase/otp/otp_use_case_impl.dart';
import 'package:express_lingua/domain/usecase/user/user_use_case.dart';
import 'package:express_lingua/domain/usecase/user/user_use_case_impl.dart';
import 'package:express_lingua/presentation/auth/login/bloc/login_bloc.dart';
import 'package:express_lingua/presentation/auth/register/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/api/nusantara/otp_api.dart';
import 'data/api/nusantara/user_api/user_api.dart';
import 'data/datasources/otp/otp_api_data_source.dart';
import 'data/datasources/otp/otp_api_data_source_impl.dart';
import 'data/datasources/user/user_api_data_source.dart';
import 'data/datasources/user/user_api_data_source_impl.dart';
import 'data/datasources/user/user_disk_data_source.dart';
import 'data/datasources/user/user_disk_data_source_impl.dart';
import 'data/db/user/user_dao.dart';
import 'data/repository/user_repository_impl.dart';
import 'domain/repository/user_repository.dart';

final sl = GetIt.instance;

Future<void> inject() async {

  final database = await $FloorAppDatabase
      .databaseBuilder('expresslingua.db')
      .build();
  sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<UserDao>(database.userDao);
  sl.registerLazySingleton<UserApi>(() => UserApi());
  sl.registerLazySingleton<UserApiDataSource>(() => UserApiDataSourceImpl(sl()));
  sl.registerLazySingleton<UserDiskDataSource>(() => UserDiskDataSourceImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(apiSource: sl(), diskSource: sl()));
  sl.registerLazySingleton<UserUseCase>(() => UserUseCaseImpl(sl()));
  sl.registerLazySingleton<OtpApi>(() => OtpApi());
  sl.registerLazySingleton<OtpApiDataSource>(() => OtpApiDataSourceImpl(sl()));
  sl.registerLazySingleton<OtpRepository>(() => OtpRepositoryImpl(sl()));
  sl.registerLazySingleton<OtpUseCase>(() => OtpUseCaseImpl(sl()));
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl(), sl()));
}