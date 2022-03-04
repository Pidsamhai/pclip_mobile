import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/model/message.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoomController extends GetxController {
  late final AuthRepository _authRepository;
  late final SupabaseClient _client;
  final String roomId;
  static const _storage = FlutterSecureStorage();
  RoomController({
    required this.roomId,
    required AuthRepository authRepository,
    required SupabaseClient client,
  }) {
    _authRepository = authRepository;
    _client = client;
  }

  Rx<List<Message>> messages = Rx<List<Message>>([]);

  @override
  onInit() async {
    super.onInit();
    String secret = (await _storage.read(key: roomId))!;
    messages.bindStream(_messageStream(secret));
  }

  Future<void> sendMessage(String msg) async {
    try {
      String secret = (await _storage.read(key: roomId))!;
      final message = Message.createJsonEncrypt(msg, secret, roomId);
      final result =
          await _client.from("room_message").insert(message).execute();
      logDebug(result.data);
      logError(result.error);
    } catch (e) {
      logError(e);
    }
  }

  Future<void> deleteMessage(String uid) async {
    try {
      final result =
          await _client.from("room_message").delete().eq("uid", uid).execute();
      logDebug(result.data);
      logError(result.error);
    } catch (e) {
      logError(e);
    }
  }

  Stream<List<Message>> _messageStream(String secret) {
    return _client
        .from("room_message:roomid=eq.$roomId")
        .stream(["uid"])
        .execute()
        .map((event) {
          logDebug(event);
          return event
              .map((e) => Message.fromJsonEncrypt(
                    e,
                    owner: _authRepository.user!.id,
                    secret: secret,
                  ))
              .toList();
        });
  }
}
