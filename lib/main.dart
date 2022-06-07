import 'package:flutter/material.dart';
import 'package:todo_app/screens/mainScreen/mainScreen.dart';

import 'objects/taskObject/listTask.dart';
import 'objects/taskObject/taskProperties1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}