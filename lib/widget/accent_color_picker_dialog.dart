import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/controller/app_controller.dart';
import 'package:pclip_mobile/theme/app_theme.dart';
import 'package:pclip_mobile/widget/color_pallet.dart';

class AccentColorPickerDialog extends Dialog {
  const AccentColorPickerDialog({Key? key}) : super(key: key);

  @override
  Widget? get child => _AccentColorPickerDialogContent();
}

class _AccentColorPickerDialogContent extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Accent Color",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox.square(dimension: 16),
          Obx(
            () => Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              children: appAccentColors
                  .map((e) => ColorPallet(
                        color: e,
                        selected: controller.accentColor.value == e,
                        onTap: () => controller.changeAccentColor(e),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox.square(dimension: 24),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: Get.back,
              child: const Text("Close"),
            ),
          ),
        ],
      ),
    );
  }
}
