import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclip_mobile/binding/sign_up_binding.dart';
import 'package:pclip_mobile/controller/sign_in_controller.dart';
import 'package:pclip_mobile/icons/custom_icons.dart';
import 'package:pclip_mobile/component/auth_state.dart';
import 'package:pclip_mobile/page/sign_up.dart';
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
              GetX<SignInController>(
                builder: (_) => widget.controller.isLoading.value
                    ? const LinearProgressIndicator()
                    : const SizedBox(),
              ),
              const SizedBox.square(dimension: 8.0),
              SizedBox(
                width: double.maxFinite,
                child: GetX<SignInController>(
                  builder: (_) => ElevatedButton(
                    onPressed: widget.controller.isLoading.value
                        ? null
                        : widget.controller.signIn,
                    child: const Text("Sign in"),
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: GetX<SignInController>(
                  builder: (_) => ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    onPressed: widget.controller.isLoading.value
                        ? null
                        : widget.controller.githubAuth,
                    icon: const Icon(CustomIcons.github_alt),
                    label: const Text("Github"),
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: GetX<SignInController>(
                  builder: (_) => ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: widget.controller.isLoading.value
                        ? null
                        : () => Get.to(
                              () => const SignUpPage(),
                              binding: SignUpBinding(),
                            ),
                    child: const Text("Create new Account"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
