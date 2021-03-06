import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import '../widgets/appbutton.dart';
import '..//widgets/input_field.dart';
import '../../values/routes/routes.dart';
import '../widgets/sign_boiler_plate.dart';
import 'login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  // void _submitLogin() async {
  //   print('LoginScreen - _submitLogin is Called');
  //   final bool result = await controller.login();
  //   // result ? Get.offNamed(AppRoutes.home) : null;
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SignBoilerPlate(
        fbKey: controller.fbKey,
        height: height,
        isSignUpPage: false,
        children: [
          JukeInputField(
            title: 'Email',
            hint: 'youremail@example.com',
            icon: Icons.email,
            emailValid: true,
            inputType: TextInputType.emailAddress,
          ),
          SizedBox(height: height * 0.02),
          JukeInputField(
            title: 'Password',
            hint: 'Password',
            icon: Icons.lock,
            passValid: true,
          ),
          SizedBox(height: height * 0.03),
          AppButton(
            title: 'Login',
            onTap: controller.login,
            isLoading: controller.loginState.value == LoginState.loading,
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
          ),
          // JukeMaterialBtn(
          //   height: height * 0.06,
          //   title: 'Sign In',
          //   onPressed: _submitLogin,
          // ),
        ],
      ),
    );
  }
}

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:get/route_manager.dart';
// import 'package:space_cube/application/state/juke_api.dart';
// import 'package:space_cube/router/route_constants.dart';
// import 'package:space_cube/widgets/snackbar_error.dart';
// import '../../widgets/sign_boiler_plate.dart';
// import '../../widgets/material_button.dart';
// import '../../widgets/input_field.dart';
// import '../../widgets/appbar.dart';

// class LogInPage extends StatefulWidget {
//   const LogInPage({Key? key}) : super(key: key);

//   @override
//   _LogInPageState createState() => _LogInPageState();
// }

// class _LogInPageState extends State<LogInPage> {
//   final _fbKey = GlobalKey<FormBuilderState>();
//   // final AuthState _authState = Get<AuthState>();
//   // get<AuthState>();

//   Future<void> _submitLogin() async {
//     _fbKey.currentState?.save();
//     if (_fbKey.currentState!.validate()) {
//       var data = _fbKey.currentState!.value;
//       print(data);
//       try {
//         var response = await JukeAPI.dio.post('login', data: data);
//         print(response);
//         if (response.statusCode == 201) {
//           Get.offNamed(homeRoute);
//         }
//       } on DioError catch (e) {
//         if (e.response == null) {
//           print('more shit');
//           snackbarError('Check Your Internet Connection');
//         }
//         print(e.response);
//         snackbarError(e.response!.data['message']);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: JukeAppBar(),
//       body: SignBoilerPlate(
//         fbKey: _fbKey,
//         height: height,
//         isSignUpPage: false,
//         children: [
//           JukeInputField(title: 'Email', hint: 'youremail@example.com', icon: Icons.email, emailValid: true, inputType: TextInputType.emailAddress),
//           SizedBox(height: height * 0.02),
//           JukeInputField(title: 'Password', hint: 'Password', icon: Icons.lock, passValid: true),
//           SizedBox(height: height * 0.03),
//           JukeMaterialBtn(height: height * 0.06, fbKey: _fbKey, title: 'Sign In', onPressed: _submitLogin),
//         ],
//       ),
//     );
//   }
// }
