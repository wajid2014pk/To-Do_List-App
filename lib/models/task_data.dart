import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: "Buy Milk"),
    Task(name: "Buy Eggs"),
    Task(name: "Buy Breads"),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get itemCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final addTaskTitle = Task(name: newTaskTitle);
    _tasks.add(addTaskTitle);
    notifyListeners();
  }

  void updateCheckBox(Task taskCheckBox) {
    taskCheckBox.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task deletetask) {
    _tasks.remove(deletetask);
    notifyListeners();
  }
}
