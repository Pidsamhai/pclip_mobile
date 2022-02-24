import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/icons/custom_icons.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Colors.grey),
              onPressed: () =>
                  Get.find<AuthRepository>().providerAuth(Provider.github),
              icon: const Icon(CustomIcons.github_alt),
              label: const Text("Github"),
            )
          ],
        ),
      ),
    );
  }
}
