import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:maltaja/app/controller/user/auth_controller.dart';
import 'package:maltaja/app/controller/root_controller.dart';
import 'package:maltaja/app/routes/app_pages.dart';

Future<void> main() async {
  FlutterNativeSplash.removeAfter(initialization);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(GetMaterialApp(
    initialBinding: BindingsBuilder(() {
      Get.put(RootController());
    }),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale("ko", "KR"),
      const Locale("en", ""),
    ],
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors
                .black), // set backbutton color here which will reflect in all screens.
      ),
    ),
    initialRoute: Routes.LOGIN,
    getPages: AppPages.pages,
  ));
}

void initialization(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 1));
}
