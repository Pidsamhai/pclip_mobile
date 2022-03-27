import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final bool isOwner;
  final String? message;
  final VoidCallback? onLongPress;
  const Message({
    Key? key,
    this.isOwner = false,
    this.message,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isOwner ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: isOwner
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.shade300,
        child: InkWell(
          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              message ?? "Sample Message",
              style: TextStyle(color: isOwner ? Colors.white : null),
            ),
          ),
        ),
      ),
    );
  }
}
