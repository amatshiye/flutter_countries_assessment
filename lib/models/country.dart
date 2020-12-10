import 'dart:convert';

import 'package:flutter/foundation.dart';

class Country {
  String name;
  String flag;
  String alpha2Code;
  String alpha3Code;
  String capital;
  String subregion;
  int population;
  double area;
  double gini;
  String demonym;
  List<dynamic> currencies;
  List<dynamic> languages;
  List<String> borders;
  Country({
    this.name,
    this.flag,
    this.alpha2Code,
    this.alpha3Code,
    this.capital,
    this.subregion,
    this.population,
    this.area,
    this.gini,
    this.demonym,
    this.currencies,
    this.languages,
    this.borders,
  });

  Country copyWith({
    String name,
    String flag,
    String alpha2Code,
    String alpha3Code,
    String capital,
    String subregion,
    int population,
    double area,
    double gini,
    String demonym,
    List<dynamic> currencies,
    List<dynamic> languages,
    List<String> borders,
  }) {
    return Country(
      name: name ?? this.name,
      flag: flag ?? this.flag,
      alpha2Code: alpha2Code ?? this.alpha2Code,
      alpha3Code: alpha3Code ?? this.alpha3Code,
      capital: capital ?? this.capital,
      subregion: subregion ?? this.subregion,
      population: population ?? this.population,
      area: area ?? this.area,
      gini: gini ?? this.gini,
      demonym: demonym ?? this.demonym,
      currencies: currencies ?? this.currencies,
      languages: languages ?? this.languages,
      borders: borders ?? this.borders,
    );
  }

  String countryDescription() {
    return "${this.name} covers an area of ${this.area} km and has a population of ${this.population}" +
        " - the nation has a Gini coefficient of ${this.gini}. " +
        "A resident of ${this.name} is called a ${this.demonym}. " +
        "The main currency accepted as legal tender is the ${this.currencies.first['name']} " +
        "which is expressed with the symbol '${this.currencies.first['symbol']}'.";
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'flag': flag,
      'alpha2Code': alpha2Code,
      'alpha3Code': alpha3Code,
      'capital': capital,
      'subregion': subregion,
      'population': population,
      'area': area,
      'gini': gini,
      'demonym': demonym,
      'currencies': currencies,
      'languages': languages,
      'borders': borders,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Country(
      name: map['name'],
      flag: map['flag'],
      alpha2Code: map['alpha2Code'],
      alpha3Code: map['alpha3Code'],
      capital: map['capital'],
      subregion: map['subregion'],
      population: map['population'],
      area: map['area'],
      gini: map['gini'],
      demonym: map['demonym'],
      currencies: List<dynamic>.from(map['currencies']),
      languages: List<dynamic>.from(map['languages']),
      borders: List<String>.from(map['borders']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Country(name: $name, flag: $flag, alpha2Code: $alpha2Code, alpha3Code: $alpha3Code, capital: $capital, subregion: $subregion, population: $population, area: $area, gini: $gini, demonym: $demonym, currencies: $currencies, languages: $languages, borders: $borders)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Country &&
        o.name == name &&
        o.flag == flag &&
        o.alpha2Code == alpha2Code &&
        o.alpha3Code == alpha3Code &&
        o.capital == capital &&
        o.subregion == subregion &&
        o.population == population &&
        o.area == area &&
        o.gini == gini &&
        o.demonym == demonym &&
        listEquals(o.currencies, currencies) &&
        listEquals(o.languages, languages) &&
        listEquals(o.borders, borders);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        flag.hashCode ^
        alpha2Code.hashCode ^
        alpha3Code.hashCode ^
        capital.hashCode ^
        subregion.hashCode ^
        population.hashCode ^
        area.hashCode ^
        gini.hashCode ^
        demonym.hashCode ^
        currencies.hashCode ^
        languages.hashCode ^
        borders.hashCode;
  }
}
