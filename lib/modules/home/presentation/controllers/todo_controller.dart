import 'package:get/get.dart';
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';
import 'package:get_x_to_do_list/modules/home/domain/usecase/get_todos_use_case.dart';
import 'package:get_x_to_do_list/modules/home/domain/usecase/save_todos_use_case.dart';

class TodoController extends GetxController {
  final GetTodosUseCase getTodosUseCase;
  final SaveTodosUseCase saveTodosUseCase;
  List<TodoModel> todos = [];

  TodoController({
    required this.getTodosUseCase,
    required this.saveTodosUseCase,
  });

  getSavedTodos() {
    todos = getTodosUseCase.call();
  }

  addInTodoList({required String title}) {
    int newId = todos.isEmpty ? 0 : todos.last.id + 1;
    TodoModel newTodo = TodoModel(
      id: newId,
      title: title,
      isCompleted: false,
    );
    todos.add(newTodo);
    saveTodosUseCase.call(
      todos: todos,
    );
    update();
  }

  removeFromTodoList({required int id}) {
    todos.removeWhere((element) => element.id == id);
    saveTodosUseCase.call(
      todos: todos,
    );
    update();
  }

  toggleIsCompletedValue({required int id}) {
    int index = todos.indexWhere((element) => element.id == id);

    if (index != -1) {
      TodoModel temp = todos[index];
      temp = temp.copyWith(
        isCompleted: !temp.isCompleted,
      );
      todos[index] = temp;
      saveTodosUseCase.call(
        todos: todos,
      );
      update();
    }
  }
}
