// Mocks generated by Mockito 5.4.4 from annotations
// in get_x_to_do_list/test/module/data/datasource/home_local_datasource/local_home_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_x_to_do_list/core/shared_prefrences/shared_preferences_client.dart'
    as _i2;
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [SharedPreferencesClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesClient extends _i1.Mock
    implements _i2.SharedPreferencesClient {
  MockSharedPreferencesClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.TodoModel> getTodos() => (super.noSuchMethod(
        Invocation.method(
          #getTodos,
          [],
        ),
        returnValue: <_i3.TodoModel>[],
      ) as List<_i3.TodoModel>);

  @override
  dynamic saveTodos({required List<_i3.TodoModel>? todos}) =>
      super.noSuchMethod(Invocation.method(
        #saveTodos,
        [],
        {#todos: todos},
      ));
}
