import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/page/hall.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';
import 'package:pclip_mobile/widget/email_password_form.dart';

class SignInController extends GetxController {
  final AuthRepository _authRepository = Get.find();
  final inputController = EmailPasswordController();

  final authError = "".obs;

  Future<void> signIn() async {
    logDebug(inputController.email);
    logDebug(inputController.pasword);
    final result = await _authRepository.signInEmailPassword(
        inputController.email, inputController.pasword);
    authError.value = result.error?.message ?? "";
    if (result.error == null) {
      Get.offAll(() => HallPage());
    }
  }
}
