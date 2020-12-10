import 'package:countries_info/models/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:countries_info/services/country_service.dart';

final countriesFutureProvider =
    FutureProvider.autoDispose<List<Country>>((ref) async {
  ref.maintainState = true;

  final countryService = ref.read(countryServiceProvider);
  final countries = await countryService.getCountries();
  return countries;
});