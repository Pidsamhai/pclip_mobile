import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/page/room.dart';
import 'package:pclip_mobile/widget/room_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
      ),
      body: Column(
        children: [
          RoomCard(
            onTab: () => Get.to(const Room(),
                arguments: {"roomName": "My Secrets room"}),
          ),
          RoomCard(onTab: () => {}),
          RoomCard(onTab: () => {}),
          RoomCard(onTab: () => {}),
          RoomCard(onTab: () => {}),
          RoomCard(onTab: () => {}),
          RoomCard(onTab: () => {}),
          RoomCard(onTab: () => {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
