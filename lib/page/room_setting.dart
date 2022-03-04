import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/controller/room_setting_controller.dart';
import 'package:pclip_mobile/widget/room_member.dart';
import 'package:pclip_mobile/widget/room_setting_input.dart';

class RoomSettingPage extends GetView<RoomSettingController> {
  RoomSettingPage({Key? key, required String roomId}) : super(key: key) {
    Get.put(RoomSettingController(roomId: roomId, client: Get.find()));
  }

  @override
  Widget build(BuildContext context) {
    final inputController = controller.inputController;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Room Setting"),
        actions: [
          IconButton(
            onPressed: () => controller.saveSetting(),
            icon: const Icon(Icons.save_rounded),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Info",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            RoomSettingInput(
              controller: inputController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Members",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ListView(
                children: [
                  RoomMemberCard(),
                  RoomMemberCard(),
                  RoomMemberCard(),
                  RoomMemberCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
