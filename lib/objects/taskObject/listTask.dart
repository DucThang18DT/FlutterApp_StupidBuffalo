import 'package:todo_app/objects/taskObject/taskProperties1.dart';
import 'package:get/get.dart';

class ListTask {
  static RxInt taskDone = 0.obs;
  static List<TaskProperties> tasks = <TaskProperties>[].obs;
}
