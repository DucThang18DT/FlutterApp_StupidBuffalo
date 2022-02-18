import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/objects/taskObject/listTask.dart';
import 'package:todo_app/objects/taskObject/taskProperties.dart';
import 'package:todo_app/screens/mainScreen/taskItem/taskitem.dart';

class MainScreen extends StatefulWidget {
  static MainScreenProperties mainPgProps = MainScreenProperties();
  static bool taskExpand = true;
  static bool completedTaskExpand = true;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          padding: EdgeInsets.all(MainScreen.mainPgProps.padding),
          children: [
            if (ListTask.taskDone < ListTask.tasks.length)
              TextButton(
                  onPressed: () {
                    setState(() {
                      if (MainScreen.taskExpand)
                        MainScreen.taskExpand = false;
                      else
                        MainScreen.taskExpand = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      Icon(
                        MainScreen.taskExpand
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                        size: MainScreen.mainPgProps.iconSize,
                        color: MainScreen.mainPgProps.iconColor,
                      ),
                      Text(
                        "Con trau ngu",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: MainScreen.mainPgProps.headerSize,
                            color: MainScreen.mainPgProps.headerColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  )),
            if (MainScreen.taskExpand)
              for (int id = 0; id < ListTask.tasks.length; id++)
                if (ListTask.tasks[id].status != Status.DONE) TaskItem(id),

            // if (ListTask.taskDone > 0)
            // Container(
            //   // height: 20,
            //   padding: EdgeInsets.all(MainScreen.mainPgProps.deviderPadding),
            //   child:
            SizedBox(
              height: 10,
            ),

            if (ListTask.taskDone > 0)
              TextButton(
                  onPressed: () {
                    setState(() {
                      if (MainScreen.completedTaskExpand)
                        MainScreen.completedTaskExpand = false;
                      else
                        MainScreen.completedTaskExpand = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      Icon(
                        MainScreen.completedTaskExpand
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                        size: MainScreen.mainPgProps.iconSize,
                        color: MainScreen.mainPgProps.iconColor,
                      ),
                      Text(
                        "Completed",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: MainScreen.mainPgProps.headerSize,
                            color: MainScreen.mainPgProps.headerColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  )),
            // ),
            if (MainScreen.completedTaskExpand)
              for (int id = 0; id < ListTask.tasks.length; id++)
                if (ListTask.tasks[id].status == Status.DONE) TaskItem(id),

            // Text('${ListTask.taskDone}'),
          ],
        ));
  }
}

class MainScreenProperties {
  double sizedBoxHeght = 50;
  double sizedBoxWidth = 30;
  double padding = 10;
  Color dividerColor = Colors.black;
  double deviderHeight = 10;
  double deviderPadding = 5;
  Color headerColor = Colors.redAccent;
  double headerSize = 20;
  double iconSize = 28;
  Color iconColor = Colors.redAccent;
}
