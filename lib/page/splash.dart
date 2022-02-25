import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/page/login.dart';
import 'package:pclip_mobile/page/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SupabaseAuthState<SplashPage>
    with SingleTickerProviderStateMixin {
  Timer? recoverSessionTimer;

  @override
  void initState() {
    super.initState();

    /// a timer to slow down session restore
    /// If not user can't really see the splash screen
    const _duration = Duration(seconds: 1);
    recoverSessionTimer = Timer(_duration, () {
      recoverSupabaseSession();
    });
  }

  /// on received auth deeplink, we should cancel recoverSessionTimer
  /// and wait for auth deep link handling result
  @override
  void onReceivedAuthDeeplink(Uri uri) {
    if (recoverSessionTimer != null) {
      recoverSessionTimer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Scaffold(
        body: Center(
          child: Text("PClip"),
        ),
      ),
    );
  }

  @override
  void onAuthenticated(Session session) {
    Get.off(() => const MainPage());
  }

  @override
  void onErrorAuthenticating(String message) {
    Get.off(() => const LoginPage());
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onUnauthenticated() {
    Get.off(() => const LoginPage());
  }
}
