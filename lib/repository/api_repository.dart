import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loggy/loggy.dart';
import 'package:pclip_mobile/model/room_invite.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';

class ApiRepository {
  final service = Dio(BaseOptions(
    baseUrl: dotenv.env["API_URL"]!,
    contentType: Headers.jsonContentType,
  ));

  final AuthRepository _authRepository;

  ApiRepository(this._authRepository);

  Future<RoomInvite> createInvivite(String roomId, String roomSecret) async {
    final result = await service.post(
      "/room/$roomId/invite",
      data: {"room_secret": roomSecret},
      options: Options(
        headers: {"Authorization": "Bearer ${_authRepository.accessToken!}"},
      ),
    );
    logDebug(result.data);
    return RoomInvite.fromJson(result.data);
  }
}
