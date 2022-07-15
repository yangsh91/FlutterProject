import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:maltaja/app/ui/root.dart';
//import 'package:maltaja/app/ui/screens/main/home.dart';
import 'package:maltaja/app/ui/screens/user/login.dart';
import 'package:maltaja/app/routes/app_pages.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  String email = '';

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => Login());
    } else {
      //print(user.email);
      this.email = user.email.toString();
      Get.offAll(() => const Root());
    }
  }

  void register(String email, String password) async {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "message",
        backgroundColor: Colors.indigo.shade900,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          '실패',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar('에러', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      Get.snackbar('에러', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
