import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final String hint;
  final String text;
  final TextEditingController? controller;
  final Widget? widget;

  MyInputField({
    Key? key,
    required this.text,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  static AddTaskProperties addTaskProps = AddTaskProperties();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(addTaskProps.padding),
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: addTaskProps.margin),
            padding: EdgeInsets.all(addTaskProps.padding),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(addTaskProps.borderRadius),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget == null ? false : true,
                    maxLines: null,
                    autofocus: true,
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5, bottom: 10),
                      hintText: this.hint,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddTaskProperties {
  Color background =
      Colors.blueGrey.shade100; //Colors.lightBlueAccent.shade200;
  double sizedBoxHeight = 50;
  double sizedBoxWidth = 30;
  double margin = 10;
  double padding = 10;
  double borderRadius = 15;
  Color headerColor = Colors.white;
  double headerSize = 20;
  double iconSize = 28;
  Color iconColor = Colors.blueAccent.shade200;
  Color noTaskColor = Colors.black26;
}
