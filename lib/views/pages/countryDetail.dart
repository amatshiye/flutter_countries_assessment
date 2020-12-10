import 'package:countries_info/theme/colors.dart';
import 'package:countries_info/views/widgets/bordering_countries.dart';
import 'package:countries_info/views/widgets/details_card.dart';
import 'package:countries_info/views/widgets/languages_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:countries_info/routes.dart';
import 'package:countries_info/models/country.dart';

class CountryDetailPage extends StatefulWidget {
  final Country country;
  CountryDetailPage({@required this.country});
  @override
  _CountryDetailPageState createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.country.name),
        actions: [
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.about)),
        ],
      ),
      body: _countryDetails(),
    );
  }

  Widget _countryDetails() {
    return ListView(
      children: [
        DetailsCard(country: widget.country),
        _titleAndSubtitle(
          icon: Icons.location_on_outlined,
          title: 'Sub-region',
          subTitle: widget.country.subregion,
        ),
        _titleAndSubtitle(
          icon: Icons.location_city,
          title: 'Capital',
          subTitle: widget.country.subregion,
        ),
        _columnTile(icon: Icons.language, title: 'Languages'),
        LanguagesGridView(country: widget.country),
        _columnTile(icon: Icons.map_outlined, title: 'Bordering Countries'),
        BorderingCountries(borders: widget.country.borders),
      ],
    );
  }

  Widget _titleAndSubtitle({IconData icon, String title, String subTitle}) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  Widget _columnTile({IconData icon, String title}) {
    Radius _borderRadiusRight = Radius.circular(25);

    return Align(
      alignment: Alignment.centerLeft,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: _borderRadiusRight,
          bottomRight: _borderRadiusRight,
        )),
        color: AppColors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
