import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient client;
  final AuthOptions _authOptions =
      AuthOptions(redirectTo: "com.github.pidsamhai.pclip://login-callback");
  // AuthOptions(redirectTo: "com.github.pidsamhai.plcip://login-callback/");
  AuthRepository({required this.client});
  Future<bool> providerAuth(Provider provider) {
    return client.auth.signInWithProvider(provider, options: _authOptions);
  }

  Future signout() async {
    try {
      final result = await client.auth.signOut();
      if (result.error != null) {
        throw Exception(result.error?.message);
      }
    } catch (e) {
      rethrow;
    }
  }
}
