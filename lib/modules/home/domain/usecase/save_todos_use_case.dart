import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';
import 'package:get_x_to_do_list/modules/home/domain/repository/home_repository.dart';

class SaveTodosUseCase {
  final HomeRepository _homeRepository;

  SaveTodosUseCase(
    this._homeRepository,
  );

  call({
    required List<TodoModel> todos,
  }) {
    return _homeRepository.saveTodos(
      todos: todos,
    );
  }
}
