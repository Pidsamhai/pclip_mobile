import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  const EmailFieldWidget({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          EmailValidator.validate(value ?? "") ? null : "Invalid email format",
      controller: controller,
      decoration: const InputDecoration(
        hintText: "Email",
        filled: true,
      ),
    );
  }
}
