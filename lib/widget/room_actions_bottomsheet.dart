import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/widget/message_actions_item.dart';

class RoomActionsBottomSheet extends StatelessWidget {
  final VoidCallback? onDelete;
  const RoomActionsBottomSheet({Key? key, this.onDelete}) : super(key: key);

  _onSetting() {
    Get.back();
  }

  _onDelete() {
    Get.back(closeOverlays: true);
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
              icon: const Icon(Icons.delete_outline_rounded),
              title: "Delete",
              onTap: _onDelete,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: MessageActionItem(
              icon: const Icon(Icons.settings),
              title: "Setting",
              onTap: _onSetting,
            ),
          ),
        ],
      ),
    );
  }
}
