import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maltaja/app/data/model/user/user_model.dart';
import 'package:maltaja/app/ui/screens/user/login.dart';

class UserController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;

  UserModel get user => userModel.value;

  set User(UserModel value) => this.userModel.value = value;

  void clear() {
    userModel.value = UserModel();
  }
}
