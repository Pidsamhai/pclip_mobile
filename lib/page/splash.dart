import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pclip_mobile/component/auth_state.dart';
import 'package:pclip_mobile/widget/email_password_form.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends AuthState<SplashPage>
    with SingleTickerProviderStateMixin {
  final controller = EmailPasswordController();
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
      body: Center(
        child: Text(
          "Pclip",
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
