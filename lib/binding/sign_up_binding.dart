import 'package:get/get.dart';
import 'package:pclip_mobile/controller/sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController(Get.find()));
  }
}
