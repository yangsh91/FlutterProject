import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class RootController extends GetxController {
  static RootController get to => Get.find();
  RxInt rootPageIndex = 0.obs;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  RxBool isCategoryPageOpen = false.obs;

  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  RxMap<String, dynamic> message = Map<String, dynamic>().obs;

  @override
  void onInit() {
    _initNotification();
    _getToken();
    super.onInit();
  }

  void changeRootPageIndex(int index) {
    rootPageIndex(index);
  }

  Future<bool> onWillPop() async {
    setCategoryPage(false);
    return !await navigatorKey.currentState!.maybePop();
  }

  void setCategoryPage(bool ck) {
    isCategoryPageOpen(ck);
  }

  void back() {
    setCategoryPage(false);
    onWillPop();
  }

  Future<void> _getToken() async {
    try {
      String? token = await _messaging.getToken();
      print("token : $token");
    } catch (e) {}
  }

  void _initNotification() {
    _messaging.requestPermission(
        sound: true, badge: true, alert: true, provisional: true);

    FirebaseMessaging.onMessage
        .listen((RemoteMessage message) => _onMessage(message.data));
    FirebaseMessaging.onMessage
        .listen((RemoteMessage message) => _onLaunch(message.data));
    FirebaseMessaging.onMessage
        .listen((RemoteMessage message) => _onResume(message.data));
  }

  Future<void>? _onResume(Map<String, dynamic> message) {
    print("_onResume : $message");
    return null;
  }

  Future<void>? _onLaunch(Map<String, dynamic> message) {
    print("_onResume : $message");
    _actionOnNotification(message);
    return null;
  }

  void _actionOnNotification(Map<String, dynamic> messageMap) {
    message(messageMap);
  }

  Future<void>? _onMessage(Map<String, dynamic> message) {
    print("_onMessage : $message");
    return null;
  }
}
