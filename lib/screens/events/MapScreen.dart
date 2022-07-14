import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  late YandexMapController controller;
  static final Point _point = Point(latitude: 51.533562, longitude: 46.034266);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YandexMap(
        onMapCreated: (YandexMapController yandexMapController) async {
          controller = yandexMapController;

          await controller.moveCamera(
              CameraUpdate.newCameraPosition(CameraPosition(target: _point, zoom: 12.0)),
          );
        },
      ),
    );
  }
}
