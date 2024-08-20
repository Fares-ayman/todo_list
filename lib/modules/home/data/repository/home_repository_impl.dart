import 'package:get_x_to_do_list/modules/home/data/datasource/local_datasource/home_local_datasource.dart';
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';
import 'package:get_x_to_do_list/modules/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImpl({
    required this.homeLocalDataSource,
  });

  @override
  List<TodoModel> getTodos() {
    return homeLocalDataSource.getTodos();
  }

  @override
  saveTodos({required List<TodoModel> todos}) {
    return homeLocalDataSource.saveTodos(todos: todos);
  }
}
