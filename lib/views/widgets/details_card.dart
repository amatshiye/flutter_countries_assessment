import 'package:flutter/material.dart';
import 'package:countries_info/theme/colors.dart';
import 'package:countries_info/models/country.dart';

class DetailsCard extends StatefulWidget {
  final Country country;

  DetailsCard({@required this.country});
  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _nameAndSubregion(),
            // _displayFlag(),
            _countryDescription(),
          ],
        ),
      ),
    );
  }

  Widget _nameAndSubregion() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.lightBlueGrey,
        child: Text(
          widget.country.alpha2Code,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(widget.country.name),
      subtitle: Text(widget.country.subregion),
    );
  }

  Widget _countryDescription() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        widget.country.countryDescription(),
      ),
    );
  }
}
