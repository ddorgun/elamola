import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:go_router/go_router.dart';


class NaverMapScreen extends StatefulWidget {
  const NaverMapScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('네이버 맵')),
  //     body: NaverMap(
  //       onMapCreated: (controller) {
  //         controller.setMapType(MapType.Basic);
  //         controller.moveCamera(
  //           CameraUpdate.scrollTo(
  //             const LatLng(37.5666102, 126.9783881),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  State<NaverMapScreen> createState() => _NaverMapState();
}

class _NaverMapState extends State<NaverMapScreen> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  LocationTrackingMode _trackingMode = LocationTrackingMode.NoFollow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('네이버 맵4'),),
      body: Stack(
        children: <Widget>[
            NaverMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.566570, 126.978442),
              zoom: 17,
            ),
            onMapCreated: onMapCreate,
            mapType: _mapType,
            initLocationTrackingMode: _trackingMode,
            locationButtonEnable: true,
            indoorEnable: true,
            onCameraChange: _onCameraChange,
            maxZoom: 17,
            minZoom: 12,
            useSurface: kReleaseMode,
            logoClickEnabled: true,
          ),
        ],
      )
    );
  }

  /// 지도 생성 완료시
  void onMapCreate(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  /// 지도 유형 선택시
  void _onTapTypeSelector(MapType type) async {
    if (_mapType != type) {
      setState(() {
        _mapType = type;
      });
    }
  }

  void _onCameraChange(
      LatLng? latLng, CameraChangeReason reason, bool? isAnimated) {
    print('카메라 움직임 >>> 위치 : ${latLng?.latitude}, ${latLng?.longitude}'
        '\n원인: $reason'
        '\n에니메이션 여부: $isAnimated');
  }

}
