import 'package:flutter/cupertino.dart';

class TextWriter extends StatelessWidget {
  Color _color;
  String _text;

  TextWriter(this._text, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
      color: _color,
      ),
      // height: _size,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            15.0,
            5.0,
            15.0,
            5.0),
        child: Text(
        _text, textScaleFactor: 1.5,
        ),
      ),
    );
  }
}