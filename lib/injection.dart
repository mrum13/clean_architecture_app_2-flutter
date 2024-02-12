import 'package:clean_architecture_app_2/core/platform/network_info.dart';
import 'package:clean_architecture_app_2/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_app_2/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_architecture_app_2/features/auth/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_app_2/features/auth/domain/usecases/login_usecase.dart';
import 'package:clean_architecture_app_2/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
final locator = GetIt.instance;

Future<void> initLocator() async {
  /// state management
  locator.registerFactory(() => LoginCubit(locator()));

  /// usecase
  locator.registerLazySingleton(() => LoginUseCase(locator()));

  /// repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: locator(),
      remoteDataSource: locator(),
      // localDataSource: locator(),
      
    ),
  );

  /// datasource
  
  /// local data source
  // locator.registerLazySingleton<DestinationLocalDataSource>(
  //   () => DestinationLocalDataSourceImpl(pref: locator()),
  // );

  /// online data source
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: locator()),
  );

  /// platform
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: locator()),
  );

  /// external
  // final pref = await SharedPreferences.getInstance();

  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Connectivity());
  // locator.registerLazySingleton(() => pref);
}