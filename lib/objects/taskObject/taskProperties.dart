enum Repeat { ONCE, EVERYDAY, CUSTOM }
enum Status { DONE, LATE, DOING }

class TaskProperties {
  String? _taskName;
  String? _description;
  Repeat _repeat = Repeat.ONCE;
  Status _status = Status.DOING;
  DateTime _dueDate = DateTime.now();
  DateTime _completeTime = DateTime.now();
  bool _remind = true;
  bool _important = true;

  // getter
  String? get taskName => _taskName;
  String? get description => _description;
  Repeat get repeat => _repeat;
  Status get status => _status;
  DateTime get dueDate => _dueDate;
  DateTime get completeTime => _completeTime;
  bool get remind => _remind;
  bool get important => _important;

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

  // Constructor
  TaskProperties(
      {String name = "Todo",
      String description = "This is a today task.",
      Repeat repeat = Repeat.ONCE,
      Status status = Status.DOING,
      bool remind = true,
      bool important = true,
      String dueDate = '2022-02-17 19:15:00Z'}) {
    newTaskName = name;
    newDescription = description;
    newRepeat = repeat;
    newDueDate = dueDate;
    newStatus = status;
    newRemind = remind;
    newImportant = important;
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
