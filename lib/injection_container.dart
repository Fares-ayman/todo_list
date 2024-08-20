import 'package:get_it/get_it.dart';
import 'package:get_x_to_do_list/core/shared_prefrences/shared_preferences_client.dart';
import 'package:get_x_to_do_list/core/shared_prefrences/shared_preferences_client_impl.dart';
import 'package:get_x_to_do_list/modules/home/data/datasource/local_datasource/home_local_datasource.dart';
import 'package:get_x_to_do_list/modules/home/data/datasource/local_datasource/home_local_datasource_impl.dart';
import 'package:get_x_to_do_list/modules/home/data/repository/home_repository_impl.dart';
import 'package:get_x_to_do_list/modules/home/domain/repository/home_repository.dart';
import 'package:get_x_to_do_list/modules/home/domain/usecase/get_todos_use_case.dart';
import 'package:get_x_to_do_list/modules/home/domain/usecase/save_todos_use_case.dart';
import 'package:get_x_to_do_list/modules/home/presentation/controllers/todo_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // home module
  ///////////////////////////////////////////////////////////////////////////////////////////
  sl.registerFactory(
    () => TodoController(
      getTodosUseCase: sl(),
      saveTodosUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetTodosUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SaveTodosUseCase(
      sl(),
    ),
  );

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeLocalDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(
      sharedPreferencesClient: sl(),
    ),
  );

  // Generic
  ///////////////////////////////////////////////////////////////////////////////////////////

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<SharedPreferencesClient>(
    () => SharedPreferencesClientImpl(
      preferences: sl(),
    ),
  );
}
