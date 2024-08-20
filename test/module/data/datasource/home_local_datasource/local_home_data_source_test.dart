import 'package:flutter_test/flutter_test.dart';
import 'package:get_x_to_do_list/core/shared_prefrences/shared_preferences_client.dart';
import 'package:get_x_to_do_list/modules/home/data/datasource/local_datasource/home_local_datasource_impl.dart';
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'local_home_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferencesClient])
void main() {
  late MockSharedPreferencesClient mockSharedPreferencesClient;
  late HomeLocalDataSourceImpl homeLocalDataSourceImpl;

  setUp(
    () {
      mockSharedPreferencesClient = MockSharedPreferencesClient();

      homeLocalDataSourceImpl = HomeLocalDataSourceImpl(
        sharedPreferencesClient: mockSharedPreferencesClient,
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
        when(mockSharedPreferencesClient.getTodos()).thenAnswer((_) => []);

        // act
        final result = homeLocalDataSourceImpl.getTodos();

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
        when(mockSharedPreferencesClient.saveTodos(todos: dummySuccessData))
            .thenAnswer((_) {});
        when(mockSharedPreferencesClient.getTodos())
            .thenAnswer((_) => dummySuccessData);

        // act
        homeLocalDataSourceImpl.saveTodos(todos: dummySuccessData);
        final result = homeLocalDataSourceImpl.getTodos();

        // assert
        expect(
          result,
          equals(dummySuccessData),
        );
      },
    );
  });
}
