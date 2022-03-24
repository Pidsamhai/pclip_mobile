import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/binding/room_binding.dart';
import 'package:pclip_mobile/controller/hall_controller.dart';
import 'package:pclip_mobile/page/room.dart';
import 'package:pclip_mobile/widget/create_room_bottomsheet.dart';
import 'package:pclip_mobile/widget/room_actions_bottomsheet.dart';
import 'package:pclip_mobile/widget/room_card.dart';
import 'package:pclip_mobile/widget/user_info_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HallPage extends GetView<HallController> {
  const HallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
        actions: [
          GestureDetector(
            onTap: () => Get.dialog(const UserInfoDialog()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: SmartRefresher(
          onRefresh: () => controller.refreshData(),
          enablePullUp: false,
          header: const ClassicHeader(),
          controller: controller.refreshController,
          child: Obx(() {
            return ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.rooms.value.length,
              itemBuilder: (context, index) {
                final item = controller.rooms.value[index];
                return RoomCard(
                  room: item,
                  onTab: () => Get.to(
                    () => const RoomPage(),
                    arguments: item,
                    binding: HomeBinding(),
                  ),
                  onLongPress: () => Get.bottomSheet(
                    RoomActionsBottomSheet(
                      onDelete: () => controller.deleteRoom(id: item.id),
                    ),
                    enableDrag: false,
                    backgroundColor: Colors.white,
                  ),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.bottomSheet(
          CreateRooomBottomSheet(
            onCreate: (name, secret) => controller.createRoom(name, secret),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
