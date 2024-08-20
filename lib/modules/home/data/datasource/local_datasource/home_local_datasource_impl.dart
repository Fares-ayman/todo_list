import 'package:get_x_to_do_list/core/shared_prefrences/shared_preferences_client.dart';
import 'package:get_x_to_do_list/modules/home/data/datasource/local_datasource/home_local_datasource.dart';
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPreferencesClient sharedPreferencesClient;

  HomeLocalDataSourceImpl({required this.sharedPreferencesClient});

  @override
  List<TodoModel> getTodos() {
    return sharedPreferencesClient.getTodos();
  }

  @override
  saveTodos({required List<TodoModel> todos}) {
    return sharedPreferencesClient.saveTodos(
      todos: todos,
    );
  }
}
