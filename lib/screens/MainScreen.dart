import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'MainButton.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    int fullHeight = MediaQuery.of(context).size.height.floor() - 91;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title: Text("Kütusekalkulaator"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MainButton(Colors.red, "100km", fullHeight/6, '/FuelPer100', Icons.flag),
              MainButton(Colors.blue, "€ -> l\n€ -> km", fullHeight/6, '/EuroToKm', Icons.euro_symbol),
              MainButton(Colors.green, "l -> km\nl -> €", fullHeight/6, '/LitreToKm', Icons.local_gas_station),
              MainButton(Colors.deepOrange, "km -> l\nkm -> €", fullHeight/6, '/KmToEuro', Icons.directions_car),
              MainButton(Colors.deepPurple, "Teekond", fullHeight/6, '/Route', Icons.directions),
              MainButton(Colors.black54, "Sätted", fullHeight/6, '/Settings', Icons.settings)
            ]
        )
    );
  }
}