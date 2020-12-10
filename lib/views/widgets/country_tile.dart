import 'package:countries_info/routes.dart';
import 'package:countries_info/theme/colors.dart';
import 'package:countries_info/views/widgets/display_svg.dart';
import 'package:flutter/material.dart';
import 'package:countries_info/models/country.dart';

class CountryTile extends StatefulWidget {
  final Country country;

  CountryTile({@required this.country, Key key}) : super(key: key);
  @override
  _CountryTileState createState() => _CountryTileState();
}

class _CountryTileState extends State<CountryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _countryListTile(),
    );
  }

  Widget _countryListTile() {
    return GestureDetector(
      child: ListTile(
        isThreeLine: true,
        leading: _smallFlagImage(),
        title: Text(widget.country.name),
        subtitle: Text(widget.country.capital),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      onTap: _navigateToCountryDetail,
    );
  }

  Widget _smallFlagImage() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DisplaySvg(
          svgUrl: widget.country.flag,
          size: Size(100, 80),
          key: ValueKey(
            widget.country.alpha3Code,
          ),
        ),
        Positioned(
          child: _displayAlpha2Code(),
          bottom: -10,
          right: -10,
        ),
      ],
    );
  }

  Widget _displayAlpha2Code() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.lightBlueGrey,
      child: SizedBox(
        height: 20,
        width: 40,
        child: Center(
          child: Text(
            widget.country.alpha2Code,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToCountryDetail() {
    Navigator.of(context).pushNamed(
      AppRoutes.countryDetail,
      arguments: widget.country,
    );
  }
}
