import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mvvm_boilerplate/presentation/features/home/viewmodel/home_cubit.dart';
import 'package:mvvm_boilerplate/presentation/features/login/viewmodel/login_cubit.dart';
import 'package:mvvm_boilerplate/presentation/features/splash/viewmodel/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/network_info.dart';
import '../data/repositories/api_repository.dart';
import '../data/sources/local/preferences_provider.dart';
import '../data/sources/remote/dio_client.dart';
import '../data/sources/remote/rest_client.dart';
import '../presentation/app/viewmodel/app_bloc.dart';
import 'environment.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Factory Features
  locator.registerFactory(() => SplashCubit(preferencesProvider: locator<PreferencesProvider>()));
  locator.registerFactory(() => LoginCubit(apiRepository: locator<APIRepository>(), preferencesProvider: locator<PreferencesProvider>()));
  locator.registerFactory(() => HomeCubit(preferencesProvider: locator<PreferencesProvider>(), apiRepository: locator<APIRepository>()));

  // Singleton Features
  locator.registerLazySingleton(() => AppBloc());

  // Repositories
  locator.registerLazySingleton(() => APIRepository(restClient: locator<RestClient>()));

  // Sources
  final dio = buildDioClient(Environment.apiUrl);
  locator.registerLazySingleton(() => RestClient(dio));
  locator.registerLazySingleton(() => PreferencesProvider(prefs: locator<SharedPreferences>()));

  // Core
  // locator.registerLazySingleton(() => GeminiService());
  // locator.registerLazySingleton(() => OpenFoodFactsService());
  locator.registerLazySingleton(() => NetworkInfo(internetConnection: locator<InternetConnection>()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => InternetConnection());
}
