import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/controller/sign_up_controller.dart';
import 'package:pclip_mobile/widget/sign_up_form.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignUpForm(controller: controller.signUpFormController),
            const SizedBox.square(dimension: 8),
            SizedBox(
              width: double.maxFinite,
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed:
                      controller.isLoading.value ? null : controller.signUp,
                  child: const Text("Create New Account"),
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value ? null : Get.back,
                  child: const Text("Back to Sing in"),
                ),
              ),
            ),
            const SizedBox.square(dimension: 8),
            Obx(
              () => controller.isLoading.value
                  ? const LinearProgressIndicator()
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
