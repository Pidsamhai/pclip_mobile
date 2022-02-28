import 'package:flutter/material.dart';
import 'package:pclip_mobile/widget/room_member.dart';
import 'package:pclip_mobile/widget/room_setting_input.dart';

class RoomSettingPage extends StatelessWidget {
  const RoomSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Room Setting")),
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
            const RoomSettingInput(),
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
