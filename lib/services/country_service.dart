import 'package:countries_info/services/countries_exception.dart';
import 'package:dio/dio.dart';
import 'package:countries_info/models/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryServiceProvider = Provider<CountryService>((ref) {
  return CountryService(Dio());
});

class CountryService {
  CountryService(this._dio);

  final Dio _dio;

  Future<List<Country>> getCountries() async {
    try {
      String _africanRegionEndpoint =
          "https://restcountries.eu/rest/v2/region/africa";

      final _response = await _dio.get(_africanRegionEndpoint);

      final _results = List<Map<String, dynamic>>.from(_response.data);
      List<Country> _countries =
          _results.map((countryData) => Country.fromMap(countryData)).toList();

      return _countries;
    } on DioError catch (dioError) {
      throw CountriesException.fromDioError(dioError);
    }
  }
}
