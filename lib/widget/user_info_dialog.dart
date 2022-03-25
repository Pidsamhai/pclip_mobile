import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/controller/user_info_controller.dart';

class UserInfoDialog extends Dialog {
  const UserInfoDialog({Key? key}) : super(key: key);

  @override
  Widget? get child => const _UserInfoDialogContent();
}

class _UserInfoDialogContent extends GetView<UserInfoController> {
  const _UserInfoDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("User Info", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox.square(dimension: 16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Email: ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: controller.user.email!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox.square(dimension: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("Close"),
              ),
              const SizedBox.square(dimension: 8),
              TextButton(
                onPressed: () => controller.signOut(),
                child: const Text("SignOut"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
