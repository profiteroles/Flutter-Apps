import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../widgets/input_field.dart';
import '../../widgets/material_button.dart';
import '../../widgets/appbar.dart';
import '../../widgets/sign_boiler_plate.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: JukeAppBar(),
        body: SignBoilerPlate(
          fbKey: _fbKey,
          height: height,
          isSignUpPage: true,
          children: [
            JukeInputField(title: 'Full Name', hint: 'Your Name', icon: Icons.person),
            SizedBox(height: height * 0.02),
            JukeInputField(title: 'Email', hint: 'youremail@example.com', icon: Icons.email, emailValid: true, inputType: TextInputType.emailAddress),
            SizedBox(height: height * 0.02),
            JukeInputField(title: 'Password', hint: 'Password', icon: Icons.lock, obscure: true, passValid: true),
            SizedBox(height: height * 0.02),
            JukeInputField(title: 'Confirm Password', hint: 'Confirm Password', icon: Icons.lock, obscure: true, passValid: true),
            SizedBox(height: height * 0.03),
            JukeMaterialBtn(
              height: height * 0.06,
              fbKey: _fbKey,
              title: 'Sign Up',
              onPressed: () {
                _fbKey.currentState?.save();
                if (_fbKey.currentState!.validate()) {
                  var data = _fbKey.currentState!.value;
                  print(data);
                  // Dio dio = new Dio();
                  // dio.post(
                  //   'path', data: data
                  // );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Yaay Bitch'),
                    backgroundColor: Colors.pink,
                  ));
                }
              },
            ),
          ],
        ));
  }
}
