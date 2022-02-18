import 'package:flutter/material.dart';
import 'package:todo_app/screens/mainScreen/mainScreen.dart';

import 'objects/taskObject/listTask.dart';
import 'objects/taskObject/taskProperties.dart';

void main() {
  while (ListTask.tasks.length > 0) {
    ListTask.tasks.removeLast();
  }
  ListTask.tasks.add(TaskProperties(
      name: "Go to school",
      description: "At 7.00 AM",
      repeat: Repeat.ONCE,
      remind: false,
      status: Status.DOING,
      important: true));
  ListTask.tasks.add(TaskProperties(
      name: "Sleep",
      description: "At 12.00 AM",
      repeat: Repeat.ONCE,
      remind: true,
      status: Status.DONE,
      important: false));
  ListTask.tasks.add(TaskProperties(
      name: "Go back home",
      description: "At 12.00 AM",
      repeat: Repeat.ONCE,
      remind: true,
      status: Status.DOING,
      important: true));
  ListTask.tasks.add(TaskProperties(
      name: "Go to zoo",
      description: "At 3.00 PM",
      repeat: Repeat.ONCE,
      remind: true,
      status: Status.DOING,
      important: false));
  for (int index = 0; index < ListTask.tasks.length; index++)
    if (ListTask.tasks[index].status == Status.DONE) ++ListTask.taskDone;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            actions: [],
          ),
          body: MainScreen()),
    );
  }
}
