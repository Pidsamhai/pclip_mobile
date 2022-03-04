import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/controller/hall_controller.dart';
import 'package:pclip_mobile/page/room.dart';
import 'package:pclip_mobile/widget/create_room_bottomsheet.dart';
import 'package:pclip_mobile/widget/progress_dialog.dart';
import 'package:pclip_mobile/widget/room_actions_bottomsheet.dart';
import 'package:pclip_mobile/widget/room_card.dart';
import 'package:pclip_mobile/widget/user_info_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HallPage extends GetView<HallController> {
  late final RefreshController _refreshController;
  late final ScrollController _scrollController;
  HallPage({Key? key}) : super(key: key) {
    _refreshController = RefreshController(initialRefresh: false);
    _scrollController = ScrollController();
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    _refreshController.refreshCompleted();
  }

  Future<void> _deleteRoom(String uid) async {
    Get.dialog(
      const ProgressDialog(),
      barrierDismissible: false,
    );
    try {
      await controller.deleteRoom(uid: uid);
    } finally {
      Get.back();
    }
  }

  Future<void> _createRoom(String name, String secret) async {
    logDebug(name);
    logDebug(secret);
    Get.dialog(
      const ProgressDialog(),
      barrierDismissible: false,
    );
    try {
      await controller.createRoom(name, secret);
    } finally {
      Get.back();
    }
  }

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
          onRefresh: _onRefresh,
          enablePullUp: false,
          header: const ClassicHeader(),
          controller: _refreshController,
          child: Obx(() {
            return ListView.builder(
              controller: _scrollController,
              itemCount: controller.rooms.value.length,
              itemBuilder: (context, index) {
                final item = controller.rooms.value[index];
                return RoomCard(
                  room: item,
                  onTab: () => Get.to(
                    () => RoomPage(
                      roomTitle: item.name,
                      roomId: item.uid,
                    ),
                  ),
                  onLongPress: () => Get.bottomSheet(
                    RoomActionsBottomSheet(
                      onDelete: () => _deleteRoom(item.uid),
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
            onCreate: (name, secret) => _createRoom(name, secret),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
