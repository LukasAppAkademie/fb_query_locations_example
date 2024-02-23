import 'package:cloud_firestore/cloud_firestore.dart';

class GeoPointModel {
  final String id;
  final double longitude;
  final double lateitude;

  GeoPointModel(
      {required this.id, required this.longitude, required this.lateitude});

  factory GeoPointModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final id = doc.id;
    final lateitude = data["latitude"];
    final longitude = data["longitude"];

    return GeoPointModel(id: id, longitude: longitude, lateitude: lateitude);
  }
}
