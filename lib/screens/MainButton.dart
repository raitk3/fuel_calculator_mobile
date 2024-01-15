import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fuel_calculator/common/TextWriter.dart';

class MainButton extends StatelessWidget{
  final Color _color;
  final String _text;
  final double _size;
  final String _routename;
  final IconData _icon;

  MainButton(this._color, this._text, this._size, this._routename, this._icon);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_size / 4),
          color: Colors.white,
      ),
      height: _size,
      margin: EdgeInsets.all(5),
      child: TextButton(
        onPressed: () { Navigator.pushNamed(context, this._routename); },
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
                textScaleFactor: _size / 40,
                style: TextStyle(color: Colors.black))
          ],
        ),
      ),
    );
  }
}