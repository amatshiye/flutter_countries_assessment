import 'package:countries_info/models/country.dart';
import 'package:flutter/cupertino.dart';

class BorderingCountriesService {
  static List<Country> getBorderingCountries({
    @required List<String> borders,
    @required List<Country> countries,
  }) {
    List<Country> _borderingCountries = [];

    borders.forEach((borderAlpha3code) {
      _borderingCountries.add(countries
          .where((country) => country.alpha3Code == borderAlpha3code)
          .first);
    });

    return _borderingCountries;
  }
}
