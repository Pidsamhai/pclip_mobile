import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/page/room_setting.dart';
import 'package:pclip_mobile/widget/create_room_bottomsheet.dart';
import 'package:pclip_mobile/widget/refresh_indicator.dart';
import 'package:pclip_mobile/widget/message.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Room extends StatefulWidget {
  final String roomTitle;
  const Room({Key? key, required this.roomTitle}) : super(key: key);

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  final _scrollController = ScrollController();
  final _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    _refreshController.loadFailed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roomTitle),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const RoomSettingPage()),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Flexible(
              child: SmartRefresher(
                scrollController: _scrollController,
                enablePullDown: false,
                enablePullUp: true,
                enableTwoLevel: false,
                onLoading: _onRefresh,
                footer: footerRefreshIndicator(),
                controller: _refreshController,
                child: ListView(
                  controller: _scrollController,
                  children: const [
                    Message(),
                    Message(),
                    Message(
                      isOwner: true,
                    ),
                    Message(
                      isOwner: true,
                      message: """Hello how are you?\nTo day is monday.""",
                    ),
                    Message(),
                    Message(),
                    Message(),
                    Message(),
                    Message(),
                    Message(),
                    Message(),
                    Message(),
                    Message(isOwner: true),
                    Message(),
                    Message(),
                    Message(),
                    Message(isOwner: true),
                    Message(),
                    Message(),
                    Message(),
                    Message(isOwner: true),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
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
                    onPressed: () => {},
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
