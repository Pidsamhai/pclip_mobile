import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/model/room.dart';
import 'package:pclip_mobile/widget/progress_dialog.dart';
import 'package:pclip_mobile/widget/room_setting_input.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoomSettingController extends GetxController {
  final SupabaseClient client;
  final inputController = RoomSettingInputController();
  final String roomId;
  static const storage = FlutterSecureStorage();
  // Rx<Room?> room = null.obs;
  RoomSettingController({
    required this.roomId,
    required this.client,
  });

  @override
  void onReady() async {
    super.onReady();
    Get.dialog(const ProgressDialog());
    try {
      final secret = await storage.read(key: roomId);
      inputController.secretController.text = secret ?? "";
      final roomResult = await client
          .from("room")
          .select()
          .eq("uid", roomId)
          .single()
          .execute();
      final room = Room.fromJson(roomResult.data);
      inputController.roomNameController.text = room.name;
    } finally {
      Get.back();
    }
  }

  Future<void> saveSetting() async {
    Get.dialog(const ProgressDialog());
    try {
      await client
          .from("room")
          .update({"name": inputController.name})
          .eq("uid", roomId)
          .execute();
      await storage.write(key: roomId, value: inputController.secret);
    } finally {
      Get.back();
    }
  }
}
