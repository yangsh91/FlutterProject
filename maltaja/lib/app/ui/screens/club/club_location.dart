import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:maltaja/app/controller/club/club_location_controller.dart';

class ClubLocation extends GetView<ClubLocationController> {
  @override
  final ClubLocationController controller = Get.put(ClubLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '클럽찾기',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        toolbarHeight: 40.0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          NaverMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.566570, 126.978442),
              zoom: 17,
            ),
            onMapCreated: controller.onMapCreated,
            mapType: MapType.Basic,
            initLocationTrackingMode: LocationTrackingMode.Face,
            locationButtonEnable: true,
            indoorEnable: true,
            onCameraChange: _onCameraChange,
            onCameraIdle: _onCameraIdle,
            markers: controller.markers,
            //onMapTap: controller._onMapTap,
            //onMapLongTap: controller._onMapLongTap,
            //onMapDoubleTap: controller._onMapDoubleTap,
            //onMapTwoFingerTap: controller._onMapTwoFingerTap,
            //onSymbolTap: controller._onSymbolTap,
            //maxZoom: 17,
            //minZoom: 15,
          ),
        ],
      ),
    );
  }

  /*
  _onMapTap(LatLng position) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
          Text('[onTap] lat: ${position.latitude}, lon: ${position.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }
  */

  void _onCameraChange(
      LatLng latLng, CameraChangeReason reason, bool isAnimated) {
    print('카메라 움직임 >>> 위치 : ${latLng.latitude}, ${latLng.longitude}'
        '\n원인: $reason'
        '\n에니메이션 여부: $isAnimated');
  }

  void _onCameraIdle() {
    print('카메라 움직임 멈춤');
  }
}
