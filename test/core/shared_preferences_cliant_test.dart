import 'package:flutter_test/flutter_test.dart';

import 'package:get_x_to_do_list/core/shared_prefrences/shared_preferences_client_impl.dart';
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
      'should return todos list ',
      () async {
        // arrange

        SharedPreferences.setMockInitialValues({}); //set values here
        SharedPreferences pref = await SharedPreferences.getInstance();
        SharedPreferencesClientImpl sharedPreferencesClientImpl =
            SharedPreferencesClientImpl(preferences: pref);
        sharedPreferencesClientImpl.saveTodos(todos: dummySuccessData);
        List<TodoModel> data = sharedPreferencesClientImpl.getTodos();

        expect(data.length, dummySuccessData.length);
        expect(data.first.id, dummySuccessData.first.id);
        expect(data.first.title, dummySuccessData.first.title);
        expect(data.first.isCompleted, dummySuccessData.first.isCompleted);
        expect(data.last.id, dummySuccessData.last.id);
        expect(data.last.title, dummySuccessData.last.title);
        expect(data.last.isCompleted, dummySuccessData.last.isCompleted);
      },
    );
  });
}
