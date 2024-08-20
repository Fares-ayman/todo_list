import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';

abstract class HomeRepository {
  List<TodoModel> getTodos();
  saveTodos({
    required List<TodoModel> todos,
  });
}
