import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TaskButton extends StatelessWidget {
  const TaskButton({
    Key? key,
    this.title,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title ?? 'confirm'.tr),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        minimumSize: const Size(150, 40),
      ),
    );
  }
}
