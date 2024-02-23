import 'package:fb_query_locations_tut/data/firebase_geo_points_repository.dart';
import 'package:fb_query_locations_tut/data/geo_points_repository.dart';
import 'package:fb_query_locations_tut/domain/GeoPointModel.dart';
import 'package:flutter/material.dart';

class GeoPointNotifier extends ChangeNotifier {
  final GeoPointRepository repo = FirebaseGeoPointRepository();

  final List<GeoPointModel> _geoPoints = [];

  List<GeoPointModel> get getPoints => _geoPoints;

  GeoPointNotifier() {
    _loadPoints();
  }

  Future<void> _loadPoints() async {
    try {
      repo.getPoints.listen((points) {
        _geoPoints.clear();
        _geoPoints.addAll(points);
        notifyListeners();
      });
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  void resetPoints() {
    repo.resetGeoPoints();
  }

  void deletePoint(GeoPointModel geoPointModel) {
    repo.deleteGeoPoint(geoPointModel);
  }

  void sendSignal() {
    repo.sendSingalPoint();
  }
}
