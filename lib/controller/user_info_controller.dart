import 'package:get/get.dart';
import 'package:pclip_mobile/page/sign_in.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';

class UserInfoController extends GetxController {
  final AuthRepository _authRepository;
  var isLoading = false.obs;
  UserInfoController(this._authRepository);
  Future signOut() async {
    try {
      isLoading.value = true;
      await _authRepository.signout();
      Get.back();
      Get.offAll(() => SignInPage());
    } finally {
      isLoading.value = false;
    }
  }
}
