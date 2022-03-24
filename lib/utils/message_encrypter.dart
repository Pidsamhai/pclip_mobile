import 'package:encrypt/encrypt.dart';

class MessageEncrypter {
  late final IV _iv;
  late final Key _key;
  late final Encrypter _encryper;
  MessageEncrypter({required String iv, required String key}) {
    _iv = IV.fromUtf8(iv);
    _key = Key.fromUtf8(key);
    _encryper = Encrypter(AES(_key, mode: AESMode.cbc));
  }
  String encrypt(String data) {
    return _encryper.encrypt(data, iv: _iv).base64;
  }

  String decrypt(String data) {
    return _encryper.decrypt(Encrypted.fromBase64(data), iv: _iv).toString();
  }
}
