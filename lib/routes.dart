import 'package:countries_info/models/country.dart';
import 'package:countries_info/views/pages/about.dart';
import 'package:countries_info/views/pages/countries.dart';
import 'package:countries_info/views/pages/countryDetail.dart';
import 'package:countries_info/views/pages/landing.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  /// App start up (loading) page
  static const String startUp = '/';

  /// App start up (loading) page
  static const String about = '/about';

  /// Country list
  static const String countries = '/countries';

  /// Country detail
  static const String countryDetail = '/countries/detail';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => LandingPage(),
          settings: settings,
        );
      case about:
        return MaterialPageRoute(
          builder: (BuildContext context) => AboutPage(),
          settings: settings,
        );
      case countries:
        return MaterialPageRoute(
          builder: (BuildContext context) => CountriesPage(),
          settings: settings,
        );
      /* TODO: add case for countryDetail
      you can extract parameters from settings.arguments if necessary 
      https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments#alternatively-extract-the-arguments-using-ongenerateroute*/
      case countryDetail:
        final Country _country = settings.arguments;
        return MaterialPageRoute(
          builder: (BuildContext context) => CountryDetailPage(
            country: _country,
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => LandingPage(),
          settings: settings,
        );
    }
  }
}
