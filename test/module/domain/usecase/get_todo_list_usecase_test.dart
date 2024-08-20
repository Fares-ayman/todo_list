import 'package:flutter_test/flutter_test.dart';

import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';

import 'package:get_x_to_do_list/modules/home/domain/repository/home_repository.dart';
import 'package:get_x_to_do_list/modules/home/domain/usecase/get_todos_use_case.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_todo_list_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository mockHomeRepository;
  late GetTodosUseCase getTodosUseCase;

  setUp(
    () {
      mockHomeRepository = MockHomeRepository();

      getTodosUseCase = GetTodosUseCase(
        mockHomeRepository,
      );
    },
  );

  group(' get todos List', () {
    List<TodoModel> dummySuccessData = [
      TodoModel(
        id: 1,
        title: 'task1',
        isCompleted: false,
      ),
      TodoModel(
        id: 2,
        title: 'task2',
        isCompleted: false,
      ),
      TodoModel(
        id: 3,
        title: 'task3',
        isCompleted: false,
      ),
      TodoModel(
        id: 4,
        title: 'task4',
        isCompleted: false,
      ),
      TodoModel(
        id: 5,
        title: 'task5',
        isCompleted: false,
      ),
    ];
    test(
      'should return empty todos list ',
      () async {
        // arrange
        when(mockHomeRepository.getTodos()).thenAnswer((_) => []);

        // act
        final result = getTodosUseCase.call();

        // assert
        expect(
          result,
          equals([]),
        );
      },
    );
    test(
      'should return  todos list after save ',
      () async {
        // arrange

        when(mockHomeRepository.getTodos()).thenAnswer((_) => dummySuccessData);

        // act

        final result = getTodosUseCase.call();

        // assert
        expect(
          result,
          equals(dummySuccessData),
        );
      },
    );
  });
}
