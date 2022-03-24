import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/model/room_invite.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InviteDialog extends Dialog {
  final RoomInvite invite;
  const InviteDialog({Key? key, required this.invite}) : super(key: key);

  _onCopyText(String text) {
    logDebug("oncopy $text");
    Clipboard.setData(ClipboardData(text: text));
    Get.rawSnackbar(message: "Copied to clipboard");
  }

  @override
  Widget? get child {
    final context = Get.context;
    TextStyle? textStyle = context != null
        ? Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black)
        : null;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QrImage(
            data: invite.toJson().toString(),
            size: 150,
          ),
          const SizedBox.square(dimension: 8),
          RichText(
            text: TextSpan(
              text: "Invite Id: ",
              style: textStyle,
              children: [
                TextSpan(
                  text: invite.inviteId,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _onCopyText(invite.inviteId),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Secret : ",
              style: textStyle,
              children: [
                TextSpan(
                  text: invite.secret,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _onCopyText(invite.secret),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox.square(dimension: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("Close"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
