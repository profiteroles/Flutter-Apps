import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/services/task_repository.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/values/utils/keys.dart';
import 'package:va_tf_todo/widgets/icons.dart';

class HomeController extends GetxController {
  HomeController({required this.taskRepository});

  static HomeController instance = Get.find();

  final TaskRepository taskRepository;
  final settingsCtrl = SettingsController.instance;
  final storage = GetStorage();

  //Task Related
  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();
  final chipIndex = 0.obs;
  final deleting = false.obs;
  final tasksList = Rx<TasksList?>(null);
  final tasks = <TasksList>[].obs;
  final doingTasks = <dynamic>[].obs;
  final doneTasks = <dynamic>[].obs;
  RxDouble taskBoxHeight = 6.0.hp.obs;

  RxInt pageIndex = 1.obs;
  RxString pageTitle = 'my_list'.tr.obs;
  RxDouble fabOpacity = 1.0.obs;

  @override
  void onInit() async {
    super.onInit();
    debugPrint('HomeController - initialised');
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks), onDone: () => debugPrint('_____task updated_______'));
    settingsCtrl.setThemeMode(await storage.read(themeKey));
  }

  @override
  void onClose() {
    debugPrint('HomeController - Closed');
    super.onClose();
    editCtrl.dispose();
  }

  void closeDialog() {
    Get.back();
    editCtrl.clear();
    changeTask(null);
  }

  void setPage(int index) {
    debugPrint('HomeController - setPage is Called Index is: $index');
    index == 1 ? fabOpacity(1) : fabOpacity(0);
    pageIndex(index);
  }

  void doneTask(String title) {
    debugPrint('HomeController - doneTask is Called title is: $title');
    var doingTask = {'title': title, 'isDone': false};
    int index = doingTasks.indexWhere((e) => mapEquals<String, dynamic>(doingTask, e));
    doingTasks.removeAt(index);
    var doneTask = {'title': title, 'isDone': true};
    doneTasks.add(doneTask);
    doingTasks.refresh();
    doneTasks.refresh();
  }

  void changeTasks(List<dynamic> select) {
    debugPrint('HomeController - changeTasks is Called');
    doingTasks.clear();
    doneTasks.clear();
    for (var i = 0; i < select.length; i++) {
      var task = select[i];
      var status = task['isDone'];
      if (status == true) {
        doneTasks.add(task);
      } else {
        doingTasks.add(task);
      }
    }
  }

  bool updateTask(TasksList task, String title) {
    debugPrint('HomeController - updateTask is called receive task - title is: $title \n'
        '${task.title} ${task.icon} ${task.color}');
    var newTasks = task.tasks ?? [];
    if (containerTask(newTasks, title)) {
      return false;
    } else {
      var aTask = {'title': title, 'isDone': false};
      newTasks.add(aTask);
      var newTask = task.copyWith(tasks: newTasks);
      int oldIdx = tasks.indexOf(task);
      tasks[oldIdx] = newTask;
      tasks.refresh();
      return true;
    }
  }

  bool containerTask(List listTasks, String title) {
    debugPrint('HomeController - containerTask is called receive task - title is: $title \n$listTasks');
    return listTasks.any((aTask) => aTask['title'] == title);
  }

  void changeTask(TasksList? selected) {
    debugPrint('HomeController - changeTask is called receive value is:\n'
        '${selected?.title} ${selected?.icon} ${selected?.color}');
    tasksList.value = selected;
  }

  void changeChipIndex(int i) {
    debugPrint('HomeController - changeChipIndex is called receive value is: $i');
    chipIndex.value = i;
  }

  void changeDeleting(bool value) {
    debugPrint('HomeController - changeDeleting is called receive value is: $value');
    deleting.value = value;
  }

  void deleteTask(TasksList task) {
    debugPrint('HomeController - deleteTask is called receive task is: \n'
        '${task.title} ${task.icon} ${task.color}');
    tasks.remove(task);
    EasyLoading.showSuccess('Task Removed');
  }

  bool addTasksList(TasksList task) {
    debugPrint('HomeController - addTasksList is called receive task is: \n'
        '${task.title} ${task.icon} ${task.color}');

    if (tasks.contains(task)) {
      return false;
    } else {
      tasks.add(task);
      return true;
    }
  }

  void addTaskFromDialog() {
    debugPrint('HomeController - addMission is called');
    if (formKey.currentState!.validate()) {
      if (tasksList.value == null) {
        EasyLoading.showError('error_choose_list'.tr);
      } else {
        final bool success = updateTask(tasksList.value!, editCtrl.text);
        if (success) {
          EasyLoading.showSuccess('Task added to your ${tasksList.value!.title}');
          closeDialog();
        } else {
          EasyLoading.showError('Task is already in the list');
        }
        editCtrl.clear();
      }
    }
  }

  bool addTask(String title) {
    debugPrint('HomeController - addTask is called receive task is: $title');

    var newTask = {'title': title, 'isDone': false};
    if (doingTasks.any((task) => mapEquals<String, dynamic>(newTask, task))) {
      return false;
    }
    var doneTask = {'title': title, 'isDone': true};
    if (doneTasks.any((task) => mapEquals<String, dynamic>(doneTask, task))) {
      return false;
    }

    doingTasks.add(newTask);
    return true;
  }

  void updateTasks() {
    debugPrint('HomeController - updateTasks is called');

    var newTasks = <Map<String, dynamic>>[];
    newTasks.addAll([...doingTasks, ...doneTasks]);
    var newTask = tasksList.value!.copyWith(tasks: newTasks);
    int oldIdx = tasks.indexOf(tasksList.value);
    tasks[oldIdx] = newTask;
    tasks.refresh();
  }

  void deleteIsDoneTask(dynamic task) {
    debugPrint('HomeController - deleteIsDoneTask is called');
    doneTasks.remove(task);
  }

  bool isTaskEmpty(TasksList task) {
    debugPrint('HomeController - isTaskEmpty is called');
    return task.tasks == null || task.tasks!.isEmpty;
  }

  int getDoneTask(TasksList task) {
    debugPrint('HomeController - getDoneTask is called');
    var res = 0;
    for (var i = 0; i < task.tasks!.length; i++) {
      if (task.tasks![i]['isDone'] == true) {
        res += 1;
      }
    }
    return res;
  }

  void addNewTaskList() {
    debugPrint('HomeController - addNewTaskList is called');
    final icons = getIcons();
    if (formKey.currentState!.validate()) {
      int icon = icons[chipIndex.value].icon!.codePoint;
      String color = icons[chipIndex.value].color!.toHex();
      var task = TasksList(title: editCtrl.text, icon: icon, color: color);

      Get.back();
      addTasksList(task) ? EasyLoading.showSuccess('${task.title} ' + 'created'.tr) : EasyLoading.showError('error_tasks_list_exist'.tr);
    }
  }

  void addForTaskScren(bool v) {
    if (formKey.currentState!.validate()) {
      var success = addTask(editCtrl.text);
      if (success) {
        EasyLoading.showSuccess('New Task added to your List');
      } else {
        EasyLoading.showError('Task is already on the list');
      }
      editCtrl.clear();
    }
  }

  void toHomePage() {
    Get.back();
    updateTasks();
    editCtrl.clear();
    changeTask(null);
  }

  int getTotalTasks() {
    int result = 0;

    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].tasks != null) {
        result += tasks[i].tasks!.length;
      }
    }

    return result;
  }

  int getTotalDoneTask() {
    int res = 0;

    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].tasks != null) {
        for (int t = 0; t < tasks[i].tasks!.length; t++) {
          if (tasks[i].tasks![t]['isDone'] == true) {
            res += 1;
          }
        }
      }
    }
    return res;
  }
}
