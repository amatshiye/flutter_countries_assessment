import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:countries_info/routes.dart';
import 'package:countries_info/models/country.dart';
import 'package:countries_info/views/widgets/display_svg.dart';
import 'package:countries_info/services/bordering_countries_service.dart';
import 'package:countries_info/services/countries_future_provider.dart';

class BorderingCountries extends ConsumerWidget {
  final List<String> borders;

  BorderingCountries({@required this.borders});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    Size _size = MediaQuery.of(context).size;
    double _containerHeight = _size.height * 0.25;
    double _containerWidth = _size.width;

    return Container(
      height: _containerHeight,
      width: _containerWidth,
      child: watch(countriesFutureProvider).when(
        error: (e, s) {
          return Text("error");
        },
        loading: () => Center(child: CircularProgressIndicator()),
        data: (countries) {
          //Update countries
          List<Country> _borderingCountries =
              BorderingCountriesService.getBorderingCountries(
            borders: this.borders,
            countries: countries,
          );
          return ListView(
            scrollDirection: Axis.horizontal,
            children: _borderingCountries
                .map(
                  (country) => GestureDetector(
                    child: _flagCard(country.flag, country.alpha3Code),
                    onTap: () => _navigateToCountryDetail(
                      context: context,
                      country: country,
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }

  Widget _flagCard(String flag, String alpha3code) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 30,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: DisplaySvg(
          svgUrl: flag,
          size: Size(200, 20),
          key: ValueKey(alpha3code),
        ),
      ),
    );
  }

  void _navigateToCountryDetail({BuildContext context, Country country}) {
    Navigator.of(context).pushNamed(
      AppRoutes.countryDetail,
      arguments: country,
    );
  }
}
