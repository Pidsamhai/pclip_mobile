import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final String? Function(String?)? validator;
  const PasswordFieldWidget({
    Key? key,
    this.controller,
    this.hint = "Password",
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _visibility = true;

  _toggleVisibility() {
    setState(() {
      _visibility = !_visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autocorrect: false,
      obscureText: _visibility,
      validator: widget.validator ??
          (text) {
            if ((text?.length ?? 0) < 6) {
              return "password must be geater than or equal 6 character";
            }
            return null;
          },
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        suffixIcon: GestureDetector(
          onTap: _toggleVisibility,
          child: Icon(_visibility
              ? Icons.visibility_rounded
              : Icons.visibility_off_rounded),
        ),
      ),
    );
  }
}
