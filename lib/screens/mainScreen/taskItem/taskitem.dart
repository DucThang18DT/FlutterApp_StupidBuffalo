import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:todo_app/objects/taskObject/listTask.dart';
import 'package:todo_app/objects/taskObject/taskProperties.dart';

class TaskItem extends StatefulWidget {
  late int index;
  // static late TaskProperties ListTask;
  static final TaskItemProperties _itemProps = TaskItemProperties();

  TaskItem(int index) {
    this.index = index;
  }
  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  viewTask() {
    // TODO
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: viewTask,
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(TaskItem._itemProps.borderRadius),
            color: ListTask.tasks[widget.index].important == true
                ? TaskItem._itemProps.itemImportantBgrColor
                : TaskItem._itemProps.itemBackground),
        padding: EdgeInsets.all(TaskItem._itemProps.padding),
        // margin: EdgeInsets.all(TaskItem._itemProps.margin),
        //color: Colors.amber,
        height: TaskItem._itemProps.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: TaskItem._itemProps.checkBoxScale,
              child: Checkbox(
                  shape: CircleBorder(),
                  value: ListTask.tasks[widget.index].status == Status.DONE
                      ? true
                      : false,
                  activeColor: TaskItem._itemProps.checkboxActiveColor,
                  onChanged: (bool? value) {
                    setState(() {
                      if (ListTask.tasks[widget.index].status == Status.DONE) {
                        // TaskItem._itemProps.checkBoxValue = false;
                        if (ListTask.tasks[widget.index].isLate())
                          ListTask.tasks[widget.index].newStatus = Status.LATE;
                        else
                          ListTask.tasks[widget.index].newStatus = Status.DOING;
                        --ListTask.taskDone;
                      } else {
                        // TaskItem._itemProps.checkBoxValue = true;
                        ListTask.tasks[widget.index].newStatus = Status.DONE;
                        ListTask.tasks[widget.index].complete();
                        ListTask.taskDone = ListTask.taskDone + 1;
                      }
                    });
                    ListTask.tasks.add(TaskProperties());
                    ListTask.tasks.removeLast();
                  }),
            ),
            SizedBox(
              width: TaskItem._itemProps.width / 3,
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ListTask.tasks[widget.index].taskName,
                      //textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TaskItem._itemProps.textColor,
                          fontSize: TaskItem._itemProps.titleSize,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ListTask.tasks[widget.index].description,
                      style: TextStyle(
                          color: TaskItem._itemProps.textColor,
                          fontSize: TaskItem._itemProps.desSize),
                    )
                  ]),
              // ),
            ),
            Padding(
              padding: EdgeInsets.all(TaskItem._itemProps.padding / 3),
              child: Icon(
                ListTask.tasks[widget.index].repeat == Repeat.ONCE
                    ? TaskItem._itemProps.repeatOnce
                    : TaskItem._itemProps.repeat,
                size: TaskItem._itemProps.iconSize,
                color: TaskItem._itemProps.iconActiveColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TaskItem._itemProps.padding / 3),
              child: Icon(Icons.alarm,
                  size: TaskItem._itemProps.iconSize,
                  color: ListTask.tasks[widget.index].remind == true
                      ? TaskItem._itemProps.iconActiveColor
                      : TaskItem._itemProps.iconOffColor),
            ),
            SizedBox(
              width: TaskItem._itemProps.width,
            )
          ],
        ),
      ),
    );
  }
}

class TaskItemProperties {
  double margin = 10;
  double padding = 10;
  double height = 75;
  double width = 10;
  double borderRadius = 30;
  double titleSize = 24;
  double desSize = 18;
  Color itemBackground = Colors.black12;
  Color itemImportantBgrColor = Colors.amberAccent;
  Color textColor = Colors.white;
  bool checkBoxValue = true;
  Color checkboxActiveColor = Colors.green;
  double checkBoxScale = 2.0;
  IconData repeatOnce = Icons.repeat_one;
  IconData repeat = Icons.repeat;
  double iconSize = 26;
  Color iconActiveColor = Colors.green;
  Color iconOffColor = Colors.black26;
}
