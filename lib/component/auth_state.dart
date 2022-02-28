import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/page/hall.dart';
import 'package:pclip_mobile/page/sign_in.dart';
import 'package:supabase/supabase.dart' as supabase;
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  String? errorMessage;

  @override
  void onUnauthenticated() {
    Get.offAll(() => const SignInPage());
  }

  @override
  void onAuthenticated(supabase.Session session) {
    Get.offAll(() => HallPage());
  }

  @override
  void onPasswordRecovery(supabase.Session session) {
    print("************* on recovery ***************");
  }

  @override
  void onErrorAuthenticating(String message) {
    print("************* Error ***************");
    print(message);
    setState(() {
      errorMessage = message;
    });
  }
}
