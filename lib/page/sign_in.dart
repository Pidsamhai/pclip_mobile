import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/controller/sign_in_controller.dart';
import 'package:pclip_mobile/icons/custom_icons.dart';
import 'package:pclip_mobile/component/auth_state.dart';
import 'package:pclip_mobile/widget/email_password_form.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  final SignInController controller = Get.put(SignInController());
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends AuthState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              EmailPasswordForm(controller: widget.controller.inputController),
              const SizedBox.square(dimension: 8.0),
              Obx(
                () => Text(
                  widget.controller.authError.value,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              ),
              const SizedBox.square(dimension: 8.0),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => widget.controller.signIn(),
                  child: const Text("SignIn"),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  onPressed: () =>
                      Supabase.instance.client.auth.signInWithProvider(
                    Provider.github,
                    options: AuthOptions(
                      redirectTo: "com.github.pidsamhai.pclip://login-callback",
                    ),
                  ),
                  icon: const Icon(CustomIcons.github_alt),
                  label: const Text("Github"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
