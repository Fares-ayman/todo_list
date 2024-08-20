import 'package:get_x_to_do_list/core/resourses/constants_manager.dart';
import 'package:get_x_to_do_list/core/shared_prefrences/shared_preferences_client.dart';
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClientImpl extends SharedPreferencesClient {
  final SharedPreferences preferences;

  SharedPreferencesClientImpl({required this.preferences});
  @override
  List<TodoModel> getTodos() {
    final String? todosString =
        preferences.getString(AppConstants.prefrencesKey);
    if (todosString != null) {
      final List<TodoModel> todos = TodoModel.decode(todosString);
      return todos;
    } else {
      return [];
    }
  }

  @override
  saveTodos({required List<TodoModel> todos}) {
    final String encodedData = TodoModel.encode(todos);
    preferences.setString(AppConstants.prefrencesKey, encodedData);
  }
}
