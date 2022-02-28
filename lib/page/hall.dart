import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/page/room.dart';
import 'package:pclip_mobile/widget/create_room_bottomsheet.dart';
import 'package:pclip_mobile/widget/room_card.dart';
import 'package:pclip_mobile/widget/user_info_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HallPage extends StatelessWidget {
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
          scrollController: _scrollController,
          controller: _refreshController,
          child: ListView(
            controller: _scrollController,
            children: [
              RoomCard(
                onTab: () =>
                    Get.to(() => const Room(roomTitle: "My Secrets room")),
              ),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
              RoomCard(onTab: () => {}),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.bottomSheet(
          const CreateRooomBottomSheet(),
          enableDrag: false,
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
