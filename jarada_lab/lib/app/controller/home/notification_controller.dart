import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationController extends GetxController {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  RxMap<String, dynamic> message = Map<String, dynamic>().obs;

  @override
  void onInit() {
    super.onInit();
    _initNotification();
    _getToken();
    initialDynamicLinks();
  }

  void _initNotification() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User grandted permission : ${settings.authorizationStatus}');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message data : ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification : ${message.notification}');
      }
    });
  }

  Future<void> _getToken() async {
    try {
      String? token = await _messaging.getToken();

      print("token : $token");

      // _messaging.onTokenRefresh.listen((token) {
      //   print('token generated');
      // }).onError((err) {
      //   print(err);
      // });
    } catch (e) {}
  }

  void initialDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      print(dynamicLinkData.link.queryParameters);
      print('go to ${dynamicLinkData.link.path}');
      Get.toNamed(dynamicLinkData.link.path);
    }).onError((error) {
      print('onLink error');
    });
  }
}
