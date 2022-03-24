import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/page/hall.dart';
import 'package:pclip_mobile/page/sign_in.dart';
import 'package:supabase/supabase.dart' as supabase;
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  String? errorMessage;

  AuthState() {
    logDebug("Create State");
  }

  @override
  void onUnauthenticated() {
    Get.offAll(() => SignInPage());
  }

  @override
  void onAuthenticated(supabase.Session session) {
    logDebug("Auth State Change");
    Get.offAll(() => HallPage());
  }

  @override
  void onPasswordRecovery(supabase.Session session) {
    logDebug("************* on recovery ***************");
  }

  @override
  void onErrorAuthenticating(String message) {
    logDebug("************* Error ***************");
    logDebug(message);
    setState(() {
      errorMessage = message;
    });
  }
}
