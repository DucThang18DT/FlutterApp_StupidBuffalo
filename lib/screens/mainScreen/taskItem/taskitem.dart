import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/objects/taskObject/listTask.dart';
import 'package:todo_app/objects/taskObject/taskProperties1.dart';
import 'package:todo_app/screens/addTaskScreen/AddTask.dart';

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
  deleteTask() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.green, width: 3),
            borderRadius: BorderRadius.all(
                Radius.circular(TaskItem._itemProps.borderRadius))),
        title: const Text('CONFIRM',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
        content: const Text(
          'Do you want to delete this Task?',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              if (ListTask.tasks[widget.index].status == Status.DONE)
                --ListTask.taskDone;
              ListTask.tasks.removeAt(widget.index);
              Navigator.pop(context, 'OK');
            },
            child: const Text(
              'OK',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  viewTask() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskPage(widget.index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: viewTask,
      onLongPress: deleteTask,
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(TaskItem._itemProps.borderRadius),
            color: ListTask.tasks[widget.index].important == true
                ? TaskItem._itemProps.itemImportantBgrColor
                : (ListTask.tasks[widget.index].status == Status.DONE
                    ? TaskItem._itemProps.itemDoneBgrColor
                    : TaskItem._itemProps.itemBackground)),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ListTask.tasks[widget.index].taskName.toString(),
                      // taskname return string or null

                      maxLines: TaskItem._itemProps.maxLine,
                      overflow: TextOverflow.ellipsis,
                      //textAlign: TextAlign.left,
                      style: TextStyle(
                          decoration:
                              ListTask.tasks[widget.index].status == Status.DONE
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                          color: TaskItem._itemProps.textColor,
                          fontSize: TaskItem._itemProps.titleSize,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ListTask.tasks[widget.index].description?.toString() ??
                          "",
                      // description return string or null

                      maxLines: TaskItem._itemProps.maxLine,
                      overflow: TextOverflow.ellipsis,
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
                color: ListTask.tasks[widget.index].important == true
                    ? TaskItem._itemProps.iconImpActiveColor
                    : TaskItem._itemProps.iconActiveColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TaskItem._itemProps.padding / 3),
              child: Icon(Icons.alarm,
                  size: TaskItem._itemProps.iconSize,
                  color: ListTask.tasks[widget.index].remind == false
                      ? TaskItem._itemProps.iconOffColor
                      : (ListTask.tasks[widget.index].important == true
                          ? TaskItem._itemProps.iconImpActiveColor
                          : TaskItem._itemProps.iconActiveColor)),
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
  double borderRadius = 15;
  double titleSize = 20;
  double desSize = 16;
  int maxLine = 1;
  Color itemBackground = Colors.white;
  Color itemDoneBgrColor = Colors.green.shade200;
  Color itemImportantBgrColor = Colors.amber.shade100;
  Color textColor = Colors.black54;
  bool checkBoxValue = true;
  Color checkboxActiveColor = Colors.green;
  double checkBoxScale = 1.5;
  IconData repeatOnce = Icons.repeat_one;
  IconData repeat = Icons.repeat;
  double iconSize = 26;
  Color iconActiveColor = Colors.green.shade400;
  Color iconImpActiveColor = Colors.amber;
  Color iconOffColor = Colors.black26;
  // Color deleteTaskWarning = Colors.red;
}
