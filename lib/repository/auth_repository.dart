import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient client;
  final AuthOptions _authOptions =
      AuthOptions(redirectTo: "com.github.pidsamhai.plcip://login-callback");
  AuthRepository({required this.client});
  Future<bool> providerAuth(Provider provider) {
    return client.auth.signInWithProvider(provider, options: _authOptions);
  }

  Future<GotrueResponse> signout() {
    return client.auth.signOut();
  }
}
