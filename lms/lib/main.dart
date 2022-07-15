import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.LOGIN,
    //defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      SfGlobalLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('ko'),
    ],
    locale: const Locale('ko'),
  ));
}
