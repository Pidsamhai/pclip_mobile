import 'package:flutter/material.dart';

class FutureButton extends StatefulWidget {
  final Future future;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final Widget? child;
  const FutureButton({
    Key? key,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.child,
    required this.future,
  }) : super(key: key);

  @override
  State<FutureButton> createState() => _FutureButtonState();
}

class _FutureButtonState extends State<FutureButton> {
  bool _onProgress = false;

  Future _callFuture() async {
    setState(() {
      _onProgress = true;
    });
    try {
      await widget.future;
    } finally {
      setState(() {
        _onProgress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onProgress ? null : _callFuture,
      onFocusChange: widget.onFocusChange,
      onHover: widget.onHover,
      focusNode: widget.focusNode,
      clipBehavior: widget.clipBehavior,
      child: _onProgress ? const Text("Loading...") : widget.child,
      style: widget.style,
    );
  }
}
