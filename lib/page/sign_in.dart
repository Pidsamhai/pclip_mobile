import 'package:flutter/material.dart';
import 'package:pclip_mobile/icons/custom_icons.dart';
import 'package:pclip_mobile/component/auth_state.dart';
import 'package:pclip_mobile/widget/email_password_form.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends AuthState<SignInPage> {
  final controller = EmailPasswordController();

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
              EmailPasswordForm(controller: controller),
              const SizedBox.square(dimension: 8.0),
              Text(
                "Error Message",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
              const SizedBox.square(dimension: 8.0),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => {},
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
