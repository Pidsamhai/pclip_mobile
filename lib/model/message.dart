import 'package:encrypt/encrypt.dart';

class Message {
  final String uid;
  final String message;
  final String? expired;
  final String sender;
  final String roomId;
  final bool isOwner;

  Message({
    required this.uid,
    required this.message,
    this.expired,
    required this.sender,
    required this.roomId,
    required this.isOwner,
  });

  factory Message.fromJson(Map<String, dynamic> json, {required String owner}) {
    return Message(
        uid: json["uid"],
        message: json["message"],
        expired: json["expired"],
        sender: json["sender"],
        roomId: json["roomid"],
        isOwner: json["sender"] == owner);
  }

  factory Message.fromJsonEncrypt(
    Map<String, dynamic> json, {
    required String owner,
    required String secret,
  }) {
    final key = Key.fromUtf8(secret);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, padding: null));
    final decryptMessage =
        encrypter.decrypt(Encrypted.fromBase64(json["message"]), iv: iv);
    return Message(
      uid: json["uid"],
      message: decryptMessage,
      expired: json["expired"],
      sender: json["sender"],
      roomId: json["roomid"],
      isOwner: json["sender"] == owner,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["uid"] = uid;
    data["message"] = message;
    data["expired"] = expired;
    data["sender"] = sender;
    data["roomid"] = roomId;
    return data;
  }

  static Map<String, dynamic> createJsonEncrypt(
    String message,
    String secret,
    String roomId,
  ) {
    final key = Key.fromUtf8(secret);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, padding: null));
    final encryptMessage = encrypter.encrypt(message, iv: iv);
    final data = <String, dynamic>{};
    data["message"] = encryptMessage.base64;
    data["roomid"] = roomId;
    return data;
  }
}
