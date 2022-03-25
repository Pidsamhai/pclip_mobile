import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';
import 'package:pclip_mobile/widget/sign_up_form.dart';

class SignUpController extends GetxController {
  final AuthRepository _authRepository;
  SignUpController(this._authRepository);
  final isLoading = false.obs;
  final signUpFormController = SignUpFormController();
  Future<void> signUp() async {
    try {
      if (!signUpFormController.valid) return;
      isLoading.value = true;
      final result = await _authRepository.signUp(
        signUpFormController.email,
        signUpFormController.pasword,
      );
      if (result.error != null) {
        throw Exception(result.error?.message);
      }
      Get.rawSnackbar(
        message: "Create accont success. Please verrify email account.",
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.green,
      );
    } catch (e) {
      logError(e);
      Get.rawSnackbar(
        message: e.toString(),
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
