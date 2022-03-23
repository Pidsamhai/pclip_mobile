import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/model/room.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  Future<void> deleteRoom({required String uid}) async {
    try {
      final result =
          await _client.from("room").delete().eq("uid", uid).execute();
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
    await Future.delayed(const Duration(seconds: 3));
    try {
      final result =
          await _client.from("room").insert({"name": name}).execute();
      final room = Room.fromJson((result.data as List).first);
      const storage = FlutterSecureStorage();
      await storage.write(key: room.uid, value: secret);
      logDebug(result.data);
      logDebug(result.error);
      logDebug(result.status);
    } catch (e) {
      logError("Create Room", [e]);
    }
  }

  Stream<List<Room>> _roomsStreams() {
    return _client.from("room").stream(["uid"]).execute().map((event) {
          return (event).map((e) => Room.fromJson(e)).toList();
        });
  }
}
