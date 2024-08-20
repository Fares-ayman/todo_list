import 'package:flutter_test/flutter_test.dart';
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';

import 'package:get_x_to_do_list/modules/home/domain/usecase/get_todos_use_case.dart';
import 'package:get_x_to_do_list/modules/home/domain/usecase/save_todos_use_case.dart';
import 'package:get_x_to_do_list/modules/home/presentation/controllers/todo_controller.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_controller_test.mocks.dart';

@GenerateMocks([
  GetTodosUseCase,
  SaveTodosUseCase,
])
void main() {
  late MockGetTodosUseCase mockGetTodosUseCase;
  late MockSaveTodosUseCase mockSaveTodosUseCase;
  late TodoController todoController;

  setUp(
    () {
      mockGetTodosUseCase = MockGetTodosUseCase();
      mockSaveTodosUseCase = MockSaveTodosUseCase();

      todoController = TodoController(
        getTodosUseCase: mockGetTodosUseCase,
        saveTodosUseCase: mockSaveTodosUseCase,
      );
    },
  );

  group('to do controller test all functions', () {
    String dummyTitle = 'task1';
    String dummyTitle2 = 'task2';
    List<TodoModel> dummySuccessData = [
      TodoModel(
        id: 0,
        title: dummyTitle,
        isCompleted: true,
      ),
    ];
    test(
      'get todo  empty list ',
      () async {
        // arrange
        when(mockGetTodosUseCase.call()).thenAnswer((_) => []);

        // act
        todoController.getSavedTodos();

        // assert
        expect(
          todoController.todos,
          equals([]),
        );
      },
    );
    test(
      'return todos list after list of operation ',
      () async {
        // arrange
        when(mockSaveTodosUseCase.call(todos: todoController.todos))
            .thenAnswer((_) {});
        when(mockGetTodosUseCase.call()).thenAnswer((_) => dummySuccessData);

        // act
        todoController.addInTodoList(title: dummyTitle);

        // assert
        expect(
          todoController.todos.first.title,
          equals(dummyTitle),
        );

        // act
        todoController.addInTodoList(title: dummyTitle2);
        // assert
        expect(
          todoController.todos.length,
          equals(2),
        );
        expect(
          todoController.todos.last.title,
          equals(dummyTitle2),
        );
        expect(
          todoController.todos.first.isCompleted,
          equals(false),
        );

        // act
        todoController.toggleIsCompletedValue(id: 0);
        // assert
        expect(
          todoController.todos.first.isCompleted,
          equals(true),
        );

        // act
        todoController.removeFromTodoList(id: 1);
        // assert
        expect(
          todoController.todos.length,
          equals(1),
        );
        expect(
          todoController.todos.first.title,
          equals(dummyTitle),
        );
        // act
        todoController.getSavedTodos();

        // assert
        expect(
          todoController.todos,
          equals(dummySuccessData),
        );
      },
    );
  });
}
