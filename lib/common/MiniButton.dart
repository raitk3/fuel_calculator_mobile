import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fuel_calculator/common/TextWriter.dart';

class MiniButton extends StatelessWidget{
  final Color _color;
  final String _text;
  final double _size;
  final String _routename;
  final IconData _icon;
  final bool _active;

  MiniButton(this._color, this._text, this._size, this._routename, this._icon, this._active);

  Widget build(BuildContext context) {
    Color color = Colors.white;
    Color textColor = Colors.black;
    if (this._active){
      color = Colors.indigoAccent;
      textColor = Colors.white;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_size),
        color: color,
      ),
      height: _size,
      margin: EdgeInsets.all(5),
      child: TextButton(
        onPressed: () { Navigator.popAndPushNamed(context, this._routename); },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(_size / 8),
            ),
            CircleAvatar(
              backgroundColor: this._color,
              radius: _size / 5,
              child:
              Icon(
                this._icon,
                color: Colors.white,
                size: _size / 4,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_size / 8),
            ),
            Text(_text,
                textScaleFactor: _size / 80,
                style: TextStyle(color: textColor))
          ],
        ),
      ),
    );
  }
}