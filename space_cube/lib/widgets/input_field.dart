import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/utils.dart';

class JukeInputField extends StatefulWidget {
  const JukeInputField({
    required this.title,
    required this.hint,
    required this.icon,
    this.radius = 30,
    this.required = true,
    this.emailValid = false,
    this.passValid = false,
    this.nameValid = false,
    this.passConfirm = '',
    this.inputType = TextInputType.text,
    this.controller,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title, hint, passConfirm;
  final TextInputType inputType;
  final double radius;
  final bool required, emailValid, passValid, nameValid;
  final TextEditingController? controller;
  @override
  State<JukeInputField> createState() => _JukeInputFieldState();
}

class _JukeInputFieldState extends State<JukeInputField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: widget.controller,
      name: widget.title.toLowerCase().replaceAll(' ', '_'),
      obscureText: widget.passValid ? obscure : false,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        labelText: widget.title,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.passValid
            ? IconButton(
                onPressed: () => setState(() => obscure = !obscure),
                icon: Icon(obscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
              )
            : null,
        hintText: widget.hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.radius)),
      ),
      validator: FormBuilderValidators.compose(
        [
          if (widget.emailValid) FormBuilderValidators.email(context),
          if (widget.required) FormBuilderValidators.required(context),
          if (widget.passValid) FormBuilderValidators.minLength(context, 8, errorText: 'Minimum 8 Characters'),
          if (widget.passConfirm.length > 7) FormBuilderValidators.match(context, widget.passConfirm),
          if (widget.nameValid)
            (value) {
              if (RegExp(r'[.,!@#$<>?":_`~;[\]\\|=+)(**&^%0-9-]').hasMatch(value!)) {
                return 'Looks like your name is quite special';
              }
            }
        ],
      ),
    );
  }
}
