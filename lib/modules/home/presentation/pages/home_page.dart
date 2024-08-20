import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x_to_do_list/core/resourses/color_manager.dart';
import 'package:get_x_to_do_list/core/resourses/style_manager.dart';
import 'package:get_x_to_do_list/modules/home/presentation/controllers/todo_controller.dart';
import 'package:get_x_to_do_list/injection_container.dart' as di;
import 'package:get_x_to_do_list/modules/home/presentation/widgets/home_body_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController titleController;
  late TodoController todoController;

  @override
  void initState() {
    titleController = TextEditingController();
    todoController = Get.put(di.sl<TodoController>());

    todoController.getSavedTodos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo List',
          style: AppTextStyle.instance.headlineSmall,
        ),
      ),
      body: GetBuilder<TodoController>(
        builder: (controller) {
          return HomeBodyWidget(
            todos: controller.todos,
            onChangedOnCheckBox: (value, item) {
              controller.toggleIsCompletedValue(
                id: item.id,
              );
            },
            onTapOnDeleteIcon: (item) {
              controller.removeFromTodoList(
                id: item.id,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleController.clear();
          Get.defaultDialog(
            title: 'Add New ToDo',
            content: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text(
                  'ToDo Title',
                  style: AppTextStyle.instance.labelMedium,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.secondryColor,
                  ),
                ),
              ),
            ),
            textCancel: 'Cancel',
            textConfirm: 'Add',
            onConfirm: () {
              final String title = titleController.text;
              if (title.isNotEmpty) {
                todoController.addInTodoList(
                  title: title,
                );
                Get.back();
              }
            },
            onCancel: () {
              Get.back();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
