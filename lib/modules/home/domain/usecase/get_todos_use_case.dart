import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';
import 'package:get_x_to_do_list/modules/home/domain/repository/home_repository.dart';

class GetTodosUseCase {
  final HomeRepository _homeRepository;

  GetTodosUseCase(
    this._homeRepository,
  );

  List<TodoModel> call() {
    return _homeRepository.getTodos();
  }
}
