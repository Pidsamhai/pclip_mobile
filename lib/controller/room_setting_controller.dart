import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/model/room.dart';
import 'package:pclip_mobile/model/room_member.dart';
import 'package:pclip_mobile/repository/api_repository.dart';
import 'package:pclip_mobile/widget/invite_data_dialog.dart';
import 'package:pclip_mobile/widget/progress_dialog.dart';
import 'package:pclip_mobile/widget/room_setting_input.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoomSettingController extends GetxController {
  final refreshController = RefreshController(initialRefresh: false);
  final SupabaseClient client;
  final ApiRepository _apiRepository = Get.find();
  final inputController = RoomSettingInputController();
  final String roomId;
  static const storage = FlutterSecureStorage();
  Rx<List<RoomMember>> members = Rx<List<RoomMember>>([]);
  RoomSettingController({
    required this.roomId,
    required this.client,
  });

  @override
  void onReady() async {
    super.onReady();
    Get.dialog(const ProgressDialog());
    try {
      await fetchData();
    } catch (e) {
      logError(e);
    } finally {
      Get.back();
    }
  }

  Future<void> fetchData() async {
    final secret = await storage.read(key: roomId);
    inputController.secretController.text = secret ?? "";
    final roomResult =
        await client.from("room").select().eq("id", roomId).single().execute();
    logError(roomResult.error);
    final room = Room.fromJson(roomResult.data);
    inputController.roomNameController.text = room.name;
    await loadMember();
  }

  Future<void> loadMember() async {
    final result = await client
        .from("room_member")
        .select()
        .eq("room_id", roomId)
        .execute();
    logDebug(result.data);
    logDebug(result.error);
    members.value =
        (result.data as List).map((e) => RoomMember.fromJson(e)).toList();
  }

  Future<void> saveSetting() async {
    Get.dialog(const ProgressDialog());
    try {
      await client
          .from("room")
          .update({"name": inputController.name})
          .eq("id", roomId)
          .execute();
      await storage.write(key: roomId, value: inputController.secret);
    } finally {
      Get.back();
    }
  }

  Future<void> addMember() async {
    final secret = await storage.read(key: roomId);
    final invite = await _apiRepository.createInvivite(roomId, secret!);
    Get.dialog(InviteDialog(invite: invite));
  }

  Future<void> refreshData() async {
    try {
      await fetchData();
      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.refreshFailed();
    }
  }

  Future<void> deleteMember(RoomMember member) async {
    try {
      Get.dialog(const ProgressDialog());
      final result = await client
          .from("room_member")
          .delete()
          .eq("member_id", member.memberId)
          .eq("room_id", member.roomId)
          .execute();
      logDebug(result.status);
      logDebug(result.error);
      logDebug(result.data);
    } finally {
      Get.back();
    }
  }
}
