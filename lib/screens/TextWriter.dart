import 'package:flutter/cupertino.dart';

class TextWriter extends StatelessWidget {
  Color _color;
  String _text;
  double _size;

  TextWriter(this._text, this._color, this._size);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,

      decoration: BoxDecoration(
      color: _color,
      ),
      height: this._size,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Text(
        this._text, textScaleFactor: 2.5,
        ),
      ),
    );
  }
}