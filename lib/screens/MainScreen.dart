import 'package:flutter/material.dart';

import 'MainButton.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    int full_height = MediaQuery.of(context).size.height.floor() - 91;
    return Scaffold(
        appBar: AppBar(
            title: Text("Kütusekalkulaator")
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MainButton(Color(0xFFC5E6A6), "100km", full_height/6, '/FuelPer100'),
              MainButton(Color(0xFFBDD2A6), "€ -> l\n€ -> km", full_height/6, '/EuroToKm'),
              MainButton(Color(0xFFB9BEA5), "l -> km\nl -> €", full_height/6, '/LitreToKm'),
              MainButton(Color(0xFFA7AAA4), "km -> l\nkm -> €", full_height/6, '/KmToEuro'),
              MainButton(Color(0xFF9899A6), "Teekond", full_height/6, '/Route'),
              MainButton(Colors.black54, "Sätted", full_height/6, '/Settings')
            ]
        )
    );
  }
}