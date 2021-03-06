import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/widget/message_actions_item.dart';

class MessageActionsBottomSheet extends StatelessWidget {
  final VoidCallback? onCopy;
  final VoidCallback? onDelete;
  const MessageActionsBottomSheet({
    Key? key,
    this.onCopy,
    this.onDelete,
  }) : super(key: key);

  _onCopy() {
    Get.back();
    onCopy?.call();
  }

  _onDelete() {
    Get.back();
    onDelete?.call();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: MessageActionItem(
              icon: const Icon(Icons.copy_outlined),
              title: "Copy",
              onTap: _onCopy,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: MessageActionItem(
              icon: const Icon(Icons.delete_outline_rounded),
              title: "Delete",
              onTap: _onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
