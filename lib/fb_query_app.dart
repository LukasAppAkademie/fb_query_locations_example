import 'package:fb_query_locations_tut/presentation/geo_point_notifier.dart';
import 'package:fb_query_locations_tut/presentation/geo_point_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FbQueryApp extends StatelessWidget {
  const FbQueryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (context) => GeoPointNotifier(),
          child: const GeoPointScreen()),
    );
  }
}
