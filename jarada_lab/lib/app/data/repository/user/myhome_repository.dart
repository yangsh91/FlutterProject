import 'package:flutter/material.dart';
import 'package:jarada_lab/app/data/provider/user/myhome_api.dart';

class MyHomeRepository {
  final MyHomeApiClient? myHomeApiClient;

  MyHomeRepository({@required this.myHomeApiClient})
      : assert(myHomeApiClient != null);

  getNoticeList() {
    return myHomeApiClient?.getNoticeList();
  }
}
