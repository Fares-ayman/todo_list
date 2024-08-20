import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';
import 'package:get_x_to_do_list/modules/home/presentation/widgets/home_body_widget.dart';

import '../../../core/widget_wrapper.dart';

void main() {
  group('HomeBodyWidget Tests', () {
    final todos = [
      TodoModel(id: 1, title: 'Test Todo 1', isCompleted: false),
      TodoModel(id: 2, title: 'Test Todo 2', isCompleted: true),
    ];

    testWidgets('should display all todos', (WidgetTester tester) async {
      await tester.pumpWidget(
        ParentWrapperWidget(child: HomeBodyWidget(todos: todos)),
      );

      expect(find.text('Test Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 2'), findsOneWidget);
    });

    testWidgets('should call onChangedOnCheckBox when checkbox is tapped',
        (WidgetTester tester) async {
      bool? checkboxValue;
      TodoModel? changedTodo;

      await tester.pumpWidget(
        ParentWrapperWidget(
          child: HomeBodyWidget(
            todos: todos,
            onChangedOnCheckBox: (value, todo) {
              checkboxValue = value;
              changedTodo = todo;
            },
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox).first);
      await tester.pump();

      expect(checkboxValue, isNotNull);
      expect(changedTodo, todos.first);
    });

    testWidgets('should call onTapOnDeleteIcon when delete icon is tapped',
        (WidgetTester tester) async {
      TodoModel? deletedTodo;
      await tester.pumpWidget(
        ParentWrapperWidget(
          child: HomeBodyWidget(
            todos: todos,
            onTapOnDeleteIcon: (todo) {
              deletedTodo = todo;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.delete).first);
      await tester.pump();

      expect(deletedTodo, todos.first);
    });

    testWidgets('should show line-through decoration for completed todos',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ParentWrapperWidget(child: HomeBodyWidget(todos: todos)),
      );

      final text = tester.widget<Text>(find.text('Test Todo 2'));
      expect(text.style?.decoration, TextDecoration.lineThrough);
    });

    testWidgets('should not show line-through decoration for incomplete todos',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ParentWrapperWidget(child: HomeBodyWidget(todos: todos)),
      );

      final text = tester.widget<Text>(find.text('Test Todo 1'));
      expect(text.style?.decoration, TextDecoration.none);
    });
  });
}
