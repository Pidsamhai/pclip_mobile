import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/widget/room_setting_input.dart';

class CreateRooomBottomSheet extends StatelessWidget {
  final RoomSettingInputController _inputController =
      RoomSettingInputController();
  final Function(String name, String secret)? onCreate;
  CreateRooomBottomSheet({Key? key, this.onCreate}) : super(key: key);

  _create() {
    if (_inputController.isValid) {
      Get.back();
      onCreate?.call(_inputController.name, _inputController.secret);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoomSettingInput(
              controller: _inputController,
            ),
            const SizedBox.square(dimension: 8),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: _create,
                child: const Text("Create"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
