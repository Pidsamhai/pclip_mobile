import 'package:flutter/material.dart';

class EmailPasswordForm extends StatefulWidget {
  final EmailPasswordController controller;
  const EmailPasswordForm({Key? key, required this.controller})
      : super(key: key);

  @override
  State<EmailPasswordForm> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> {
  bool _visibility = false;

  _toggleVisibility() {
    setState(() {
      _visibility = !_visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.state,
      child: Column(
        children: [
          TextField(
            controller: widget.controller.emailController,
            decoration: const InputDecoration(
              hintText: "Email",
              filled: true,
            ),
          ),
          const SizedBox.square(dimension: 8.0),
          TextField(
            controller: widget.controller.passwordController,
            autocorrect: false,
            obscureText: _visibility,
            decoration: InputDecoration(
              hintText: "Password",
              filled: true,
              suffixIcon: GestureDetector(
                onTap: _toggleVisibility,
                child: Icon(_visibility
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded),
              ),
            ),
          ),
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
  String get pasword => emailController.text;
  bool get valid => state.currentState?.validate() == true;
  final bool validateOnChange;
  EmailPasswordController({this.validateOnChange = false});
}
