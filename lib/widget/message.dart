import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final bool isOwner;
  final String? message;
  const Message({Key? key, this.isOwner = false, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isOwner ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: isOwner ? Colors.blue : Colors.grey.shade300,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(message ?? "Sample Message"),
        ),
      ),
    );
  }
}
