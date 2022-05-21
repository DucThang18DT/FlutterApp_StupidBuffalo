import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/addTaskScreen/button.dart';
import 'package:todo_app/screens/addTaskScreen/input_field.dart';
import 'package:todo_app/screens/mainScreen/mainScreen.dart';

import '../../objects/taskObject/listTask.dart';
import '../mainScreen/taskItem/taskitem.dart';
import 'package:todo_app/objects/taskObject/taskProperties.dart';


class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() {
    return _AddTaskPageState();
  }
}
List<String> repeat = ['One','EveryDays'];

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  void initState() {
    _titleControl.text;
    _descriptionControl.text;
    super.initState();
  }

  @override
  void dispose() {
    _titleControl.dispose();
    _descriptionControl.dispose();
    super.dispose();
  }

  static AddTaskProperties Props = AddTaskProperties();
  DateTime _choseDateTime = DateTime.now();
  String _StartTime = DateFormat.jm().format(DateTime.now()).toString();
  String _EndTime = DateFormat.jm().format(DateTime.now()).toString();
  String newRepeat = '';
  final TextEditingController _titleControl = TextEditingController();
  final TextEditingController _descriptionControl = TextEditingController();

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    home: Scaffold(
          backgroundColor: Props.background,
          appBar: AppBar(
            title: Text(
              'Add Task',
              style: TextStyle(
                  fontSize: Props.headerSize, fontWeight: FontWeight.bold),
            ),
            // actions: [HomeButton()],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyInputField(text: 'Title', hint: 'Enter the title', controller: _titleControl),
                    MyInputField(
                        text: 'Description', hint: 'Enter the description', controller: _descriptionControl),
                    MyInputField(
                      text: 'Date',
                      hint: DateFormat('dd-MM-yyyy').format(_choseDateTime),
                      widget: IconButton(
                        icon: Icon(Icons.calendar_today_outlined,
                            color: Colors.grey),
                        onPressed: () {
                          _getDateData();
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyInputField(
                            hint: _StartTime,
                            text: 'Start Time',
                            widget: IconButton(
                              icon: Icon(Icons.access_time_rounded,
                                  color: Colors.grey),
                              onPressed: () {
                                _getTimeData(isStartTime: true);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: MyInputField(
                            hint: _EndTime,
                            text: 'End Time',
                            widget: IconButton(
                              icon: Icon(Icons.access_time_rounded,
                                  color: Colors.grey),
                              onPressed: () {
                                _getTimeData(isStartTime: false);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    MyInputField(text: 'Repeat', hint: "${newRepeat}",
                    widget: DropdownButton(
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.grey,),
                      iconSize: 32,
                      elevation: 4,
                      underline: Container( height: 0,),
                      items: repeat.map<DropdownMenuItem<String>>((String? value)
                      {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!,)
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          newRepeat = value.toString();
                        });
                      },
                    ),
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 15, left: 10),
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(

                            ),
                            child: Button(label: 'Cancel', onTap: ()=> Navigator.pop(context))),
                        Container(
                          padding: EdgeInsets.only(top: 15, right: 10),
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(

                          ),
                            child: Button(label: 'Save', onTap: ()=> _getBack())
                        ),
                      ],
                    ),
                  ],

                ),
              ),
            ),
          ),
        ),
  );

  _getBack(){
    if(_titleControl.text.isNotEmpty&&_descriptionControl.text.isNotEmpty){
    _addList();
    Navigator.pop(context);
    }
    else if(_titleControl.text.isEmpty||_descriptionControl.text.isEmpty){
      Get.snackbar('Error', 'Missing title or description',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error_outline),
      );
    }
  }

  _addList(){
       Future.delayed(Duration.zero, () async {
         ListTask.tasks.add( TaskProperties(
             name: _titleControl.text,
             description: _descriptionControl.text,
             repeat: Repeat.ONCE,
             remind: false,
             status: Status.DOING,
             important: true));
         for (int index = 0; index < ListTask.tasks.length; index++)
           if (ListTask.tasks[index].status == Status.DONE) ++ListTask.taskDone;
         return ListTask.tasks.length + 1;
       });
  }
  _getDateData() async {
    DateTime? _pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025));
    if (_pickDate != null) {
      setState(() {
        _choseDateTime = _pickDate;
      });
    } else {
      print('Pick wrong date');
    }
  }

  _getTimeData({required bool isStartTime}) async{
    final TimeOfDay pickTime = await _showTimePicker();
    if(pickTime==null){
      print('hello');
    }else if(isStartTime == true){
      setState(() {
        _StartTime = pickTime.format(context);
      });
    }else if(isStartTime == false){
      setState(() {
        _EndTime = pickTime.format(context);
      });
    }
  }

  _showTimePicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}
