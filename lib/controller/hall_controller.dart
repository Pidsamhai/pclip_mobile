import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/model/room.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class HallController extends GetxController {
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

  refreshData() {
    refresh();
  }

  Future<void> deleteRoom({required String id}) async {
    try {
      final result = await _client.from("room").delete().eq("id", id).execute();
      logDebug(result.data);
      logDebug(result.error);
      logDebug(result.status);
      return;
    } catch (e) {
      logError(e);
      return;
    }
  }

  Future<void> createRoom(String name, String secret) async {
    try {
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
    }
  }

  Stream<List<Room>> _roomsStreams() {
    return _client.from("room").stream(["id"]).execute().map((event) {
          return (event).map((e) => Room.fromJson(e)).toList();
        });
  }
}
