import 'package:get/get.dart';
import 'package:pclip_mobile/page/sign_in.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';
import 'package:pclip_mobile/widget/progress_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserInfoController extends GetxController {
  final AuthRepository _authRepository;
  User get user => _authRepository.user!;
  UserInfoController(this._authRepository);
  Future signOut() async {
    try {
      Get.back();
      ProgressDialog.show();
      await _authRepository.signout();
      Get.offAll(() => SignInPage());
    } finally {
      Get.back();
    }
  }
}
