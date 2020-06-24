import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainButton extends StatelessWidget{
  final Color _color;
  final String text;
  final double size;
  final String _routename;
  final IconData _icon;

  MainButton(this._color, this.text, this.size, this._routename, this._icon);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
      ),
      height: this.size,
      child: FlatButton(
        onPressed: () { Navigator.pushNamed(context, this._routename); },
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: this._color,
              radius: 25,
              child:
                Icon(
                this._icon,
                color: Colors.white,
                size: 35.0,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(
                10.0
              ),
            ),

            Text(this.text, textScaleFactor: 2,)
          ],
        ),
      ),
    );
  }
  
  
}