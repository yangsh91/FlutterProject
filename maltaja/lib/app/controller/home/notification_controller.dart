import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  RxMap<String, dynamic> message = Map<String, dynamic>().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> _getToken() async {
    try {
      String? token = await _messaging.getToken();
    } catch (e) {}
  }

  void _initNotification() {
    _messaging.requestPermission(
        sound: true, badge: true, alert: true, provisional: true);

    //_messaging
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
