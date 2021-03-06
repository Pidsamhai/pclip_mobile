import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/controller/room_setting_controller.dart';
import 'package:pclip_mobile/widget/room_member.dart';
import 'package:pclip_mobile/widget/room_setting_input.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RoomSettingPage extends GetView<RoomSettingController> {
  const RoomSettingPage({Key? key}) : super(key: key);

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
          ),
          IconButton(
            onPressed: () => controller.addMember(),
            icon: const Icon(Icons.person_add_rounded),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () => controller.refreshData(),
                enablePullUp: false,
                header: const ClassicHeader(),
                child: SingleChildScrollView(
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
                      Obx(
                        () => Column(
                          children: controller.members.value
                              .map((e) => RoomMemberCard(
                                    roomMember: e,
                                    onDelete: () => controller.deleteMember(e),
                                  ))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton.icon(
                onPressed: controller.leaveRoom,
                icon: const Icon(Icons.exit_to_app_rounded),
                label: const Text("Leave Room"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
