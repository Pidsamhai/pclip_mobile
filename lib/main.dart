import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loggy/loggy.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pclip_mobile/controller/app_controller.dart';
import 'package:pclip_mobile/controller/hall_controller.dart';
import 'package:pclip_mobile/controller/user_info_controller.dart';
import 'package:pclip_mobile/page/splash.dart';
import 'package:pclip_mobile/repository/api_repository.dart';
import 'package:pclip_mobile/repository/auth_repository.dart';
import 'package:pclip_mobile/component/secure_storage.dart';
import 'package:pclip_mobile/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Loggy.initLoggy(
    logOptions: const LogOptions(
      (kDebugMode || kProfileMode) ? LogLevel.all : LogLevel.off,
    ),
  );

  await dotenv.load(fileName: ".env");

  logDebug(dotenv.env);

  await Supabase.initialize(
    url: dotenv.env["SUPABASE_API_URL"],
    anonKey: dotenv.env["SUPABASE_ANON_KEY"],
    authCallbackUrlHostname: 'login-callback',
    localStorage: SecureLocalStorage(),
    debug: true,
  );

  await GetStorage.init();
  await Get.putAsync<PackageInfo>((() => PackageInfo.fromPlatform()));
  Get.put<SupabaseClient>(Supabase.instance.client);
  Get.put<AuthRepository>(AuthRepository(client: Get.find(), pkg: Get.find()));
  Get.put<UserInfoController>(UserInfoController(Get.find()));
  Get.put<HallController>(HallController(
    client: Get.find(),
  ));
  Get.put(ApiRepository(Get.find()));
  Get.put(AppController());

  runApp(const MyApp());
}

class MyApp extends GetView<AppController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        darkTheme: appTheme(
          context,
          primarySwatch: controller.accentColor.value,
          brightness: Brightness.dark,
        ),
        theme: appTheme(context, primarySwatch: controller.accentColor.value),
        home: const SplashPage(),
      ),
    );
  }
}
