import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_x_to_do_list/core/resourses/color_manager.dart';
import 'package:get_x_to_do_list/core/resourses/style_manager.dart';
import 'package:get_x_to_do_list/core/resourses/values_manager.dart';
import 'package:get_x_to_do_list/modules/home/data/models/todo_model.dart';

class HomeBodyWidget extends StatelessWidget {
  final List<TodoModel> todos;
  final Function(bool?, TodoModel)? onChangedOnCheckBox;
  final Function(TodoModel)? onTapOnDeleteIcon;
  const HomeBodyWidget({
    super.key,
    required this.todos,
    this.onChangedOnCheckBox,
    this.onTapOnDeleteIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final TodoModel item = todos[index];
          return ListTile(
            title: Text(
              item.title,
              style: AppTextStyle.instance.bodyLarge.copyWith(
                decoration: item.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            leading: Checkbox(
              value: item.isCompleted,
              onChanged: (value) {
                if (onChangedOnCheckBox != null) {
                  onChangedOnCheckBox!.call(value, item);
                }
              },
            ),
            trailing: InkWell(
              onTap: () {
                if (onTapOnDeleteIcon != null) {
                  onTapOnDeleteIcon!.call(item);
                }
              },
              child: SizedBox(
                height: AppSize.s30.h,
                width: AppSize.s30.h,
                child: Icon(
                  Icons.delete,
                  color: AppColor.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
