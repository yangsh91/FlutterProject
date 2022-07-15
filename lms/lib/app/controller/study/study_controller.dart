import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lms/app/data/repository/study_repository.dart';
import 'package:lms/app/data/model/study/study_model.dart';
import 'package:meta/meta.dart';

class StudyController extends GetxController {
  final StudyRepository? repository;
  SharedPreferences? logindata;
  String? no, user_id;

  StudyController({@required this.repository}) : assert(repository != null);

  @override
  void onInit() async {
    logindata = await SharedPreferences.getInstance();
    this.no = logindata!.getString('no');
    this.user_id = logindata!.getString('user_id');

    getTestList();

    super.onInit();
  }

  final _testList = <StudyModel>[].obs;
  get testList => this._testList.value;
  set testList(value) => this._testList.value = value;

  getTestList() async {
    repository?.getTestList(user_id: user_id).then((data) {
      _testList.addAll(data);
    });
  }
}
