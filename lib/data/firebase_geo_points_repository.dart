import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_query_locations_tut/data/geo_points_repository.dart';
import 'package:fb_query_locations_tut/domain/GeoPointModel.dart';

class FirebaseGeoPointRepository implements GeoPointRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void deleteGeoPoint(GeoPointModel model) {
    final CollectionReference<Map<String, dynamic>> locationReference =
        _firestore.collection("locations");
    locationReference.doc(model.id).delete();
  }

  @override
  Stream<List<GeoPointModel>> get getPoints => _firestore
      .collection("locations")
      .snapshots()
      .map((locationInstance) => locationInstance.docs
          .map((eintrag) => GeoPointModel.fromFirestore(eintrag))
          .toList());

  @override
  void resetGeoPoints() {
    final CollectionReference<Map<String, dynamic>> locationsCollectionRef =
        _firestore.collection('locations');
    locationsCollectionRef.get().then((snapshot) {
      for (final doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  @override
  void sendSingalPoint() {
    final CollectionReference<Map<String, dynamic>> locationsCollectionRef =
        _firestore.collection('locations');
    final randomGeoPoint = generaterateRanomSignal();
    locationsCollectionRef.add({
      "latitude": randomGeoPoint.lateitude,
      "longitude": randomGeoPoint.longitude,
    });
  }
}

GeoPointModel generaterateRanomSignal() => GeoPointModel(
      id: 'UNUSED',
      lateitude: Random().nextDouble() * 180 - 90,
      longitude: Random().nextDouble() * 180 - 90,
    );
