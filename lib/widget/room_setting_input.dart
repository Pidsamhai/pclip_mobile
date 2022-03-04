import 'package:flutter/material.dart';
import 'package:pclip_mobile/icons/custom_icons.dart';
import 'package:random_password_generator/random_password_generator.dart';

class RoomSettingInput extends StatelessWidget {
  final RoomSettingInputController? controller;
  static final _rndp = RandomPasswordGenerator();
  const RoomSettingInput({Key? key, this.controller}) : super(key: key);

  _randomPasword() {
    controller?.secretController.text =
        _rndp.randomPassword(passwordLength: 32);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller?.state,
      child: Column(
        children: [
          TextFormField(
            controller: controller?.roomNameController,
            decoration: const InputDecoration(
              hintText: "Room Name",
              filled: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox.square(dimension: 8),
          TextFormField(
            maxLength: 32,
            controller: controller?.secretController,
            decoration: InputDecoration(
              hintText: "Room Secrets",
              filled: true,
              suffixIcon: IconButton(
                onPressed: _randomPasword,
                icon: const Icon(CustomIcons.random),
              ),
            ),
            validator: (value) {
              if (value == null || value.length != 32) {
                return 'Secret must be 32 charactor';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class RoomSettingInputController {
  final roomNameController = TextEditingController();
  final secretController = TextEditingController();
  final state = GlobalKey<FormState>();
  String get name => roomNameController.text;
  String get secret => secretController.text;
  bool get isValid => state.currentState?.validate() == true;
}
