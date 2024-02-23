import 'package:fb_query_locations_tut/domain/GeoPointModel.dart';

abstract class GeoPointRepository {
  Stream<List<GeoPointModel>> get getPoints;
  void deleteGeoPoint(GeoPointModel model);
  void resetGeoPoints();
  void sendSingalPoint();
}
