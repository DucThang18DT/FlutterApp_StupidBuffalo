import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        onPressed: () {
          // TODO
        },
      ),
    );
  }
}

class AddButtonProperties {
  double size = 28;
  Color color = Colors.white;
}
