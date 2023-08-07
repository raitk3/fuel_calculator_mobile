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
        borderRadius: BorderRadius.circular(this.size / 4),
          color: Colors.white,
      ),
      height: this.size,
      margin: EdgeInsets.all(5),
      child: TextButton(
        onPressed: () { Navigator.pushNamed(context, this._routename); },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(this.size / 8),
            ),
            CircleAvatar(
              backgroundColor: this._color,
              radius: this.size / 5,
              child:
                Icon(
                this._icon,
                color: Colors.white,
                size: this.size / 4,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(this.size / 8),
            ),

            Text(this.text,
                textScaleFactor: 2,
                style: TextStyle(color: Colors.black))
          ],
        ),
      ),
    );
  }
  
  
}