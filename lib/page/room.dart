import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/widget/message.dart';

class Room extends StatelessWidget {
  const Room({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Get.arguments["roomName"])),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: [
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
                ],
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
