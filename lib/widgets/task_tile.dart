import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String tasktitle;
  final Function? checkboxCallBack;
  final Function()? longPresscheckboxCallBack;

  const TaskTile({
    super.key,
    required this.tasktitle,
    required this.isChecked,
    this.checkboxCallBack,
    this.longPresscheckboxCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPresscheckboxCallBack,
      title: Text(
        tasktitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlue,
        value: isChecked,
        onChanged: (newValue) {
          checkboxCallBack!(newValue);
        },
      ),
    );
  }
}
