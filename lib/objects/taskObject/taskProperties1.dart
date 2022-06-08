enum Repeat { ONCE, EVERYDAY, CUSTOM }
enum Status { DONE, LATE, DOING }

class TaskProperties {
  late String _taskName;
  String? _description;
  Repeat _repeat = Repeat.ONCE;
  Status _status = Status.DOING;
  DateTime _dueDate = DateTime.now();
  DateTime _completeTime = DateTime.now();
  late String _startTime;
  late String _endTime;
  bool _remind = true;
  bool _important = true;

  // getter
  String get taskName => _taskName;
  String? get description => _description;
  Repeat get repeat => _repeat;
  Status get status => _status;
  DateTime get dueDate => _dueDate;
  DateTime get completeTime => _completeTime;
  bool get remind => _remind;
  bool get important => _important;
  String get startTime => _startTime;
  String get endTime => _endTime;

  // setter
  set newTaskName(String name) {
    _taskName = name;
  }

  set newDescription(String des) {
    _description = des;
  }

  set newRepeat(Repeat repeat) {
    _repeat = repeat;
  }

  set newStatus(Status status) {
    _status = status;
  }

  set newDueDate(String time) {
    _dueDate = DateTime.parse(time);
  }

  set newCompleteTime(String time) {
    _completeTime = DateTime.parse(time);
  }

  set newRemind(bool remind) {
    _remind = remind;
  }

  set newImportant(bool important) {
    _important = important;
  }

  set newStartTime(String startTime) {
    _startTime = startTime;
  }

  set newEndTime(String endTime) {
    _endTime = endTime;
  }

  // Constructor
  TaskProperties(
      {String name = "Todo",
      String description = "This is a today task.",
      Repeat repeat = Repeat.ONCE,
      Status status = Status.DOING,
      bool remind = true,
      bool important = true,
      String dueDate = '2022-02-17 19:15:00Z',
      String startTime = "",
      String endTime = ""}) {
    newTaskName = name;
    newDescription = description;
    newRepeat = repeat;
    newDueDate = dueDate;
    newStatus = status;
    newRemind = remind;
    newImportant = important;
    newStartTime = startTime;
    newEndTime = endTime;
  }

  // methods

  bool isLate() {
    DateTime _now = DateTime.now();
    if (dueDate.isBefore(_now))
      return true;
    else
      return false;
  }

  void complete() {
    _completeTime = DateTime.now();
  }
}
