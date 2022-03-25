import 'package:flutter/material.dart';
import 'package:pclip_mobile/widget/email_field.dart';
import 'package:pclip_mobile/widget/password_field.dart';

class EmailPasswordForm extends StatefulWidget {
  final EmailPasswordController controller;
  const EmailPasswordForm({Key? key, required this.controller})
      : super(key: key);

  @override
  State<EmailPasswordForm> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.state,
      child: Column(
        children: [
          EmailFieldWidget(controller: widget.controller.emailController),
          const SizedBox.square(dimension: 8.0),
          PasswordFieldWidget(controller: widget.controller.passwordController)
        ],
      ),
    );
  }
}

class EmailPasswordController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final state = GlobalKey<FormState>();
  String get email => emailController.text;
  String get pasword => passwordController.text;
  bool get valid => state.currentState?.validate() == true;
  final bool validateOnChange;
  EmailPasswordController({this.validateOnChange = false});
}
