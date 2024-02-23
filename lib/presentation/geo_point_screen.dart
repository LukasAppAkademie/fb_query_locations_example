import 'package:fb_query_locations_tut/presentation/geo_point_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeoPointScreen extends StatelessWidget {
  const GeoPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GeoPointNotifier geoPointNotifier =
        Provider.of<GeoPointNotifier>(context, listen: true);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: geoPointNotifier.getPoints.length,
              itemBuilder: (context, index) {
                final geoPoint = geoPointNotifier.getPoints[index];
                return ListTile(
                  subtitle:
                      Text('${geoPoint.lateitude}, ${geoPoint.longitude}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      geoPointNotifier.deletePoint(geoPoint);
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              geoPointNotifier.sendSignal();
            },
            child: const Text('Send Signal'),
          ),
        ],
      ),
    );
  }
}
