import 'package:encrypt/encrypt.dart';
import 'package:pclip_mobile/utils/message_encrypter.dart';

class Message {
  final String id;
  final String message;
  final String? expired;
  final String sender;
  final String roomId;
  final bool isOwner;

  Message({
    required this.id,
    required this.message,
    this.expired,
    required this.sender,
    required this.roomId,
    required this.isOwner,
  });

  factory Message.fromJson(Map<String, dynamic> json, {required String owner}) {
    return Message(
      id: json["id"],
      message: json["message"],
      expired: json["expired"],
      sender: json["sender"],
      roomId: json["room_id"],
      isOwner: json["sender"] == owner,
    );
  }

  factory Message.fromJsonEncrypt(
    Map<String, dynamic> json, {
    required String owner,
    required MessageEncrypter encrypter,
  }) {
    return Message(
      id: json["id"],
      message: encrypter.decrypt(json["message"]),
      expired: json["expired"],
      sender: json["sender"],
      roomId: json["room_id"],
      isOwner: json["sender"] == owner,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["message"] = message;
    data["expired"] = expired;
    data["sender"] = sender;
    data["room_id"] = roomId;
    return data;
  }

  static Map<String, dynamic> createJsonEncrypt(
    String message,
    String roomId,
    MessageEncrypter encrypter,
  ) {
    final data = <String, dynamic>{};
    data["message"] = encrypter.encrypt(message);
    data["room_id"] = roomId;
    return data;
  }
}
