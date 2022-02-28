import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/controller/user_info_controller.dart';

class UserInfoDialog extends GetView<UserInfoController> {
  const UserInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.maxFinite,
          // color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.isLoading.value
                          ? null
                          : controller.signOut(),
                      child: Text(controller.isLoading.value
                          ? "Loading..."
                          : "SignOut"),
                    ),
                    const SizedBox.square(dimension: 8),
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      child: Text("Close"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
