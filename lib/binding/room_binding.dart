import 'package:get/get.dart';
import 'package:pclip_mobile/controller/room_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomController>(
      () => RoomController(
        authRepository: Get.find(),
        client: Get.find(),
      ),
    );
  }
}
