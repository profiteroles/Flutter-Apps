import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../values/utils/extention.dart';
import '../controller.dart';
import 'login_container.dart';
import 'signup_container.dart';

class ToggleAnimationContainer extends GetView<AuthController> {
  const ToggleAnimationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInBack,
        top: controller.isSignupScreen() ? 200 : 250,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInBack,
          height: controller.isSignupScreen() ? 53.0.hp : 37.0.hp,
          padding: EdgeInsets.all(5.0.wp),
          width: 90.0.wp,
          margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 15, spreadRadius: 5)],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => controller.toggleContainers(false),
                      style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
                      child: Text(
                        'login'.tr,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: !controller.isSignupScreen() ? Theme.of(context).textTheme.headline6!.color : Theme.of(context).inputDecorationTheme.hintStyle!.color,
                              fontWeight: !controller.isSignupScreen() ? FontWeight.bold : FontWeight.normal,
                            ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.toggleContainers(true),
                      style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
                      child: Text(
                        'signup'.tr,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: controller.isSignupScreen() ? FontWeight.bold : FontWeight.normal,
                              color: controller.isSignupScreen() ? Theme.of(context).textTheme.headline6!.color : Theme.of(context).inputDecorationTheme.hintStyle!.color,
                            ),
                      ),
                    ),
                  ],
                ),
                controller.isSignupScreen() ? SignUpContainer() : const LoginContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
