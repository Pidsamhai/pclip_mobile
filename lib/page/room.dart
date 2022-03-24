import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/binding/room_setting_binding.dart';
import 'package:pclip_mobile/controller/room_controller.dart';
import 'package:pclip_mobile/page/room_setting.dart';
import 'package:pclip_mobile/widget/message_actions_bottomsheet.dart';
import 'package:pclip_mobile/widget/message.dart';

class RoomPage extends GetView<RoomController> {
  const RoomPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.room.name),
        actions: [
          IconButton(
            onPressed: () => Get.to(
              () => const RoomSettingPage(),
              arguments: Get.arguments,
              binding: RoomSettingBinding(),
            ),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Flexible(
              child: GetX<RoomController>(
                init: controller,
                builder: (controller) => GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: ListView.builder(
                    reverse: true,
                    itemCount: controller.messages.value.length,
                    controller: controller.scrollController,
                    itemBuilder: (context, index) {
                      final message = controller.messages.value[index];
                      return Message(
                        message: message.message,
                        isOwner: message.isOwner,
                        onLongPress: () => Get.bottomSheet(
                          MessageActionsBottomSheet(
                            onCopy: () => {},
                            onDelete: () =>
                                controller.deleteMessage(message.id),
                          ),
                          backgroundColor: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: controller.messageController,
                minLines: 1,
                maxLines: 99,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Aa",
                  prefixIcon: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.add_circle_rounded),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => controller.sendMessage(),
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _RoomPageState extends State<RoomPage> {
//   final _messageController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       try {
//         // widget.controller.scrollController.jumpTo(
//         //     widget.controller.scrollController.position.maxScrollExtent);
//       } finally {}
//     });
//   }

  

  
// }
