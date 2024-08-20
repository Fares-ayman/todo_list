import 'package:flutter_test/flutter_test.dart';

import 'package:get_x_to_do_list/modules/home/data/datasource/local_datasource/home_local_datasource.dart';

import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';
import 'package:get_x_to_do_list/modules/home/data/repository/home_repository_impl.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([HomeLocalDataSource])
void main() {
  late MockHomeLocalDataSource mockHomeLocalDataSource;
  late HomeRepositoryImpl homeRepositoryImpl;

  setUp(
    () {
      mockHomeLocalDataSource = MockHomeLocalDataSource();

      homeRepositoryImpl = HomeRepositoryImpl(
        homeLocalDataSource: mockHomeLocalDataSource,
      );
    },
  );

  group('save and get todos List', () {
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
        when(mockHomeLocalDataSource.getTodos()).thenAnswer((_) => []);

        // act
        final result = homeRepositoryImpl.getTodos();

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
        when(mockHomeLocalDataSource.saveTodos(todos: dummySuccessData))
            .thenAnswer((_) {});
        when(mockHomeLocalDataSource.getTodos())
            .thenAnswer((_) => dummySuccessData);

        // act
        homeRepositoryImpl.saveTodos(todos: dummySuccessData);
        final result = homeRepositoryImpl.getTodos();

        // assert
        expect(
          result,
          equals(dummySuccessData),
        );
      },
    );
  });
}
