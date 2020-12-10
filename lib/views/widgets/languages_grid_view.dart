import 'package:countries_info/models/country.dart';
import 'package:flutter/material.dart';

class LanguagesGridView extends StatefulWidget {
  final Country country;

  LanguagesGridView({@required this.country});
  @override
  _LanguagesGridViewState createState() => _LanguagesGridViewState();
}

class _LanguagesGridViewState extends State<LanguagesGridView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: GridView.extent(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          maxCrossAxisExtent: 250,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.2,
          children: widget.country.languages
              .map((language) => _languageCard(
                  langName: language['name'],
                  nativeLanguage: language['nativeName']))
              .toList(),
        ),
      ),
    );
  }

  Widget _languageCard({
    @required String langName,
    @required String nativeLanguage,
  }) {
    Size _size = MediaQuery.of(context).size;
    double _height = _size.height;
    double _width = _size.width;

    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment(-0.5, -0.11),
          end: Alignment(1.0, -0.13),
          colors: [const Color(0xff00abba), const Color(0xff0082c5)],
          stops: [0.0, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _languageText(langName),
          _languageText('($nativeLanguage)'),
        ],
      ),
    );
  }

  Widget _languageText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
