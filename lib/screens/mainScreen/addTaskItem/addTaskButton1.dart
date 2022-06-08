// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/addTaskScreen/AddTask.dart';
import 'package:todo_app/screens/notificationScreen/notification.dart';
import 'package:todo_app/objects/taskObject/listTask.dart';

class AddTaskButton extends StatelessWidget {
  static AddButtonProperties _props = AddButtonProperties();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.add,
          size: _props.size,
          color: _props.color,
        ),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTaskPage(ListTask.tasks.length)),
          );
          NotificationApi.showNotification(
              title: 'Success', body: 'Add new todo task');
        },
      ),
    );
  }
}

class AddButtonProperties {
  double size = 28;
  Color color = Colors.white;
}
