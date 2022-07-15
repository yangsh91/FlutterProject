import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class ClubLocationController extends GetxController {
  Completer<NaverMapController> _controller = Completer();

  MapType _mapType = MapType.Basic;
  LocationTrackingMode _trackingMode = LocationTrackingMode.NoFollow;
  List<Marker> markers = [];

  @override
  void onInit() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      OverlayImage.fromAssetImage(
        assetName: 'assets/images/horse_back1.png',
      ).then((value) {
        markers.add(Marker(
          markerId: 'id',
          position: LatLng(37.21338, 126.60838),
          captionText: '승마장',
          captionColor: Colors.indigo,
          captionTextSize: 16.0,
          anchor: AnchorPoint(0.5, 1),
          width: 40,
          height: 40,
        ));
      });
    });

    super.onInit();
  }

  /// 지도 생성 완료시
  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  /// 지도 유형 선택시
  void _onTapTypeSelector(MapType type) async {
    if (_mapType != type) {
      _mapType = type;
    }
  }

  /// my location button
  // void _onTapLocation() async {
  //   final controller = await _controller.future;
  //   controller.setLocationTrackingMode(LocationTrackingMode.Follow);
  // }

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
