import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget{
  final Color _color;
  final String text;
  final double size;
  final String _routename;

  MainButton(this._color, this.text, this.size, this._routename);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: _color,
      ),
      height: this.size,
      child: OutlineButton(
        onPressed: () { Navigator.pushNamed(context, this._routename); },
        child: Text(this.text, textScaleFactor: 2,
        ),
      ),
    );
  }
  
  
}