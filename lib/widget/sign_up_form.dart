import 'package:flutter/material.dart';
import 'package:pclip_mobile/widget/email_field.dart';
import 'package:pclip_mobile/widget/email_password_form.dart';
import 'package:pclip_mobile/widget/password_field.dart';
import 'package:email_validator/email_validator.dart';

class SignUpForm extends StatefulWidget {
  final SignUpFormController controller;
  const SignUpForm({Key? key, required this.controller}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.state,
      child: Column(
        children: [
          EmailFieldWidget(controller: widget.controller.emailController),
          const SizedBox.square(dimension: 8.0),
          PasswordFieldWidget(controller: widget.controller.passwordController),
          const SizedBox.square(dimension: 8.0),
          PasswordFieldWidget(
            controller: widget.controller.cofirmPasswordController,
            hint: "Confirm Password",
            validator: (text) {
              return widget.controller.passwordIsMatch
                  ? null
                  : "Password not match";
            },
          )
        ],
      ),
    );
  }
}

class SignUpFormController extends EmailPasswordController {
  final cofirmPasswordController = TextEditingController();
  bool get passwordIsMatch =>
      cofirmPasswordController.text == passwordController.text;
}
