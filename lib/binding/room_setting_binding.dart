import 'package:get/get.dart';
import 'package:pclip_mobile/controller/room_setting_controller.dart';

class RoomSettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomSettingController>(
      () => RoomSettingController(
        client: Get.find(),
      ),
    );
  }
}
