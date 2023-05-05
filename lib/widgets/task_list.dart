import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task_data.dart';
import 'package:to_do_list_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasklList extends StatelessWidget {
  const TasklList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.itemCount,
          itemBuilder: (context, index) {
            final taskItemData = taskData.tasks[index];
            return TaskTile(
              isChecked: taskItemData.isDone,
              tasktitle: taskItemData.name,
              checkboxCallBack: (checkboxState) {
                taskData.updateCheckBox(taskItemData);
              },
              longPresscheckboxCallBack: () {
                taskData.deleteTask(taskItemData);
              },
            );
          },
        );
      }),
    );
  }
}
