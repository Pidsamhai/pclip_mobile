import 'package:flutter/material.dart';

class MessageActionItem extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback? onTap;
  const MessageActionItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox.square(dimension: 4.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}
