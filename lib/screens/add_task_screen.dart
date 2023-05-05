import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack;

  const AddTaskScreen(this.addTaskCallBack, {super.key});

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.lightBlue),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
          const SizedBox(
            height: 100,
          )
        ]),
      ),
    );
  }
}
