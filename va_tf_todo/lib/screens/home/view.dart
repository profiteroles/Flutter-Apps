import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/add_cart.dart';
import 'package:va_tf_todo/screens/home/widgets/task_card.dart';
import 'package:va_tf_todo/screens/profile/view.dart';
import 'package:va_tf_todo/screens/settings/view.dart';
import 'package:va_tf_todo/widgets/bottom_navbar.dart';
import 'package:va_tf_todo/widgets/fab_button.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FabDragBtn(),
      bottomNavigationBar: const AppBottomNavBar(),
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.pageIndex(),
            children: const [ProfileScreen(), TodoListScreen(), SettingScreen()],
          ),
        ),
      ),
    );
  }
}

class TodoListScreen extends GetView<HomeController> {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const FlatAppBar('My List', hasInfoIcon: true),
        Obx(
          () => GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ...controller.tasks
                  .map(
                    (task) => LongPressDraggable(
                      child: TaskCard(task: task),
                      data: task,
                      onDragStarted: () => controller.changeDeleting(true),
                      onDraggableCanceled: (_, __) => controller.changeDeleting(false),
                      onDragEnd: (_) => controller.changeDeleting(false),
                      feedback: Opacity(
                        opacity: .8,
                        child: TaskCard(task: task),
                      ),
                    ),
                  )
                  .toList(),
              const AddCard(),
            ],
          ),
        ),
      ],
    );
  }
}
