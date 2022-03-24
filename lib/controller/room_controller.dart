import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/model/message.dart';
import 'package:pclip_mobile/model/room.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';
import 'package:pclip_mobile/utils/message_encrypter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoomController extends GetxController {
  late final Room room = Get.arguments;
  late final AuthRepository _authRepository;
  late final SupabaseClient _client;
  late final MessageEncrypter _encrypter;
  static const _storage = FlutterSecureStorage();
  final scrollController = ScrollController();
  final refreshController = RefreshController();
  RoomController({
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
    logDebug(room);
    String secret = (await _storage.read(key: room.id))!;
    _encrypter = MessageEncrypter(iv: room.iv, key: secret);
    messages.bindStream(_messageStream(secret));
  }

  Future<void> sendMessage(String msg) async {
    try {
      final message = Message.createJsonEncrypt(msg, room.id, _encrypter);
      logDebug(message);
      final result =
          await _client.from("room_message").insert(message).execute();
      logDebug(result.data);
      logError(result.error);
    } catch (e) {
      logError(e);
    }
  }

  Future<void> deleteMessage(String id) async {
    try {
      final result =
          await _client.from("room_message").delete().eq("id", id).execute();
      logDebug(result.data);
      logError(result.error);
    } catch (e) {
      logError(e);
    }
  }

  Stream<List<Message>> _messageStream(String secret) {
    return _client
        .from("room_message:room_id=eq.${room.id}")
        .stream(["id"])
        .execute()
        .map((event) {
          logDebug(event);
          return event
              .map((e) => Message.fromJsonEncrypt(
                    e,
                    owner: _authRepository.user!.id,
                    encrypter: _encrypter,
                  ))
              .toList();
        });
  }
}
