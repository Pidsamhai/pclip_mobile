import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/model/room.dart';
import 'package:pclip_mobile/widget/progress_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class HallController extends GetxController {
  final refreshController = RefreshController(initialRefresh: false);
  final scrollController = ScrollController();
  late final SupabaseClient _client;
  HallController({
    required SupabaseClient client,
  }) {
    _client = client;
  }

  Rx<List<Room>> rooms = Rx<List<Room>>([]);

  @override
  void onInit() async {
    super.onInit();
    rooms.bindStream(_roomsStreams());
  }

  Future<void> refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    onInit();
    refreshController.refreshCompleted();
  }

  Future<void> deleteRoom({required String id}) async {
    try {
      ProgressDialog.show();
      final result = await _client.from("room").delete().eq("id", id).execute();
      logDebug(result.data);
      logDebug(result.error);
      logDebug(result.status);
      return;
    } catch (e) {
      logError(e);
      return;
    } finally {
      Get.back();
    }
  }

  Future<void> createRoom(String name, String secret) async {
    try {
      ProgressDialog.show();
      final payload = {"id": const Uuid().v4(), "name": name};
      final result = await _client
          .from("room")
          .insert(payload, returning: ReturningOption.minimal)
          .execute();
      if (result.error != null) {
        throw Exception(result.error?.message);
      }
      const storage = FlutterSecureStorage();
      await storage.write(key: payload["id"]!, value: secret);
    } catch (e) {
      logError(e);
    } finally {
      Get.back();
    }
  }

  Stream<List<Room>> _roomsStreams() {
    return _client.from("room").stream(["id"]).execute().map((event) {
          return (event).map((e) => Room.fromJson(e)).toList();
        });
  }
}
