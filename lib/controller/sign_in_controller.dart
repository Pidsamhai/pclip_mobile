import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/page/hall.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';
import 'package:pclip_mobile/widget/email_password_form.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInController extends GetxController {
  final AuthRepository _authRepository = Get.find();
  final inputController = EmailPasswordController();

  final isLoading = false.obs;

  Future<void> signIn() async {
    try {
      if (!inputController.valid) return;
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 3));
      final result = await _authRepository.signInEmailPassword(
        inputController.email,
        inputController.pasword,
      );

      if (result.error != null) {
        Get.rawSnackbar(
          message: result.error?.message,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
        );
      }

      if (result.error == null) {
        Get.offAll(() => const HallPage());
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> githubAuth() async {
    try {
      await _authRepository.providerAuth(Provider.github);
    } catch (e) {
      Get.rawSnackbar(
        message: "Error",
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      );
    }
  }
}
