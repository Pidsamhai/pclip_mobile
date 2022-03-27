import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pclip_mobile/theme/app_theme.dart';

class AppController extends GetxController {
  static final _storage = GetStorage();
  final accentColor = Colors.blue.obs;

  AppController() {
    final _colorIndex = _storage.read<int>("accent_color");
    if (_colorIndex != null) {
      accentColor.value = appAccentColors[_colorIndex];
    }
  }

  changeAccentColor(MaterialColor color) {
    accentColor.value = color;
    _storage.write("accent_color", appAccentColors.indexOf(accentColor.value));
  }
}
