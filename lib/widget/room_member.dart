import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/model/room_member.dart';
import 'package:pclip_mobile/widget/confirm_dialog.dart';

class RoomMemberCard extends StatelessWidget {
  final VoidCallback? onDelete;
  final RoomMember roomMember;
  const RoomMemberCard({Key? key, required this.roomMember, this.onDelete})
      : super(key: key);

  _onDelete() {
    Get.dialog(
        ConfirmDialog(message: "Confirm delete member", onConfirm: onDelete));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomMember.deviceName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox.square(dimension: 4),
                  Text(
                    roomMember.memberId,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _onDelete(),
              icon: const Icon(Icons.close_rounded),
            )
          ],
        ),
      ),
    );
  }
}
