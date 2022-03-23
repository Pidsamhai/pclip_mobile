import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient client;
  final PackageInfo pkg;
  late final AuthOptions _authOptions;
  AuthRepository({required this.client, required this.pkg}) {
    _authOptions = AuthOptions(
      redirectTo: "${pkg.packageName}://login-callback",
    );
  }
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

  User? get user => client.auth.currentUser;
}
