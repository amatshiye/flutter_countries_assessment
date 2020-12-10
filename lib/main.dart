import 'package:countries_info/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

void main() {
  runApp(ProviderScope(child: PalotaCountriesAssessmentApp()));
}

class PalotaCountriesAssessmentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.startUp,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
