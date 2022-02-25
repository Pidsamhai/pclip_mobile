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
    recoverSessionTimer = Timer(const Duration(seconds: 1), () {
      recoverSupabaseSession();
    });
  }

  @override
  void onReceivedAuthDeeplink(Uri uri) {
    if (recoverSessionTimer != null) {
      recoverSessionTimer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Text(
            "PClip",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
          ),
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
