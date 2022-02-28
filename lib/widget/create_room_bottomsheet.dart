import 'package:flutter/material.dart';
import 'package:pclip_mobile/widget/room_setting_input.dart';

class CreateRooomBottomSheet extends StatelessWidget {
  const CreateRooomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const RoomSettingInput(),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text("Create"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
