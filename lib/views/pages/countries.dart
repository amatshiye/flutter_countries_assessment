import 'package:countries_info/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:countries_info/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:countries_info/views/widgets/country_tile.dart';
import 'package:countries_info/services/countries_future_provider.dart';

class CountriesPage extends ConsumerWidget {
  final TextEditingController _searchBarText = TextEditingController();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text("African Countries"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.about),
          ),
        ],
      ),
      body: watch(countriesFutureProvider).when(
        error: (e, s) {
          return Text("error");
        },
        loading: () => Center(child: CircularProgressIndicator()),
        data: (countries) {
          Size _size = MediaQuery.of(context).size;
          double _searchBarHight = _size.height * 0.10;
          double _listViewHight = _size.height * 0.80;
          List<Country> _countryList = (_searchBarText.text.isEmpty)
              ? countries
              : _searchCountries(countries);

          return ListView(
            children: [
              Container(
                height: _searchBarHight,
                child: _searchBar(context),
              ),
              Container(
                height: _listViewHight,
                child: ListView(
                  children: _countryList
                      .map((country) => CountryTile(
                            country: country,
                            key: ValueKey(country.alpha3Code),
                          ))
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Country> _searchCountries(List<Country> _countries) {
    List<Country> _newCountriesList = [];
    RegExp _searchPattern = new RegExp(
      r'' + '${_searchBarText.text}*',
      caseSensitive: false,
      multiLine: false,
    );

    _newCountriesList = _countries
        .where(
          (element) => element.name.contains(
            _searchPattern,
          ),
        )
        .toList();

    return _newCountriesList;
  }

  Widget _searchBar(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _searchBarWidth = _size.width * 0.90;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: _searchBarWidth,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            top: 5,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Countries',
              border: InputBorder.none,
            ),
            onChanged: (value) {
              print(value);
              _searchBarText.text = value;
            },
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}
