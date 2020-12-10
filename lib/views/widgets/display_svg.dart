import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DisplaySvg extends StatefulWidget {
  final String svgUrl;
  final Size size;

  DisplaySvg({@required this.svgUrl, @required this.size, Key key})
      : super(key: key);
  @override
  _DisplaySvgState createState() => _DisplaySvgState();
}

class _DisplaySvgState extends State<DisplaySvg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _renderSvg(),
    );
  }

  Widget _renderSvg() {
    return SizedBox(
      height: widget.size.height,
      width: widget.size.width,
      child: SvgPicture.network(
        widget.svgUrl,
        width: 900,
        height: 600,
        fit: BoxFit.cover,
        headers: {
          "Content-Type": "image/svg+xml",
          "Vary": "Accept-Encoding",
        },
      ),
    );
  }
}
