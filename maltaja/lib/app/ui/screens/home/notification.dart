import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/home/notification_controller.dart';

class Notification extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Notification'),
      ),
    );
  }
}
