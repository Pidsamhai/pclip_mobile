import 'package:flutter/material.dart';

class RoomSettingInput extends StatelessWidget {
  const RoomSettingInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextField(
          // autofocus: true,
          decoration: InputDecoration(hintText: "Room Name", filled: true),
        ),
        SizedBox.square(dimension: 8),
        TextField(
          decoration: InputDecoration(hintText: "Room Secrets", filled: true),
        ),
      ],
    );
  }
}
