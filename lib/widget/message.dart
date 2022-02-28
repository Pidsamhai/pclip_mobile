import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/widget/message_actions_bottomsheet.dart';

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
        child: InkWell(
          onLongPress: () => Get.bottomSheet(
            const MessageActionsBottomSheet(),
            enableDrag: false,
            backgroundColor: Colors.white,
          ),
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
