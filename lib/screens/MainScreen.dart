import 'package:flutter/material.dart';
import 'package:fuelcalculator/calculators/Calculator.dart';
import 'package:fuelcalculator/screens/calculators/Per100Getter.dart';

import 'MainButton.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    int full_height = MediaQuery.of(context).size.height.floor() - 91;
    return Scaffold(
        appBar: AppBar(
            title: Text("Fuel calculator")
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MainButton(Colors.red, "100km", full_height/6, '/FuelPer100'),
              MainButton(Colors.orange, "€ -> l\n€ -> km", full_height/6, '/EuroToKm'),
              MainButton(Colors.green, "l -> km\nl -> €", full_height/6, '/LitreToKm'),
              MainButton(Colors.cyan, "km -> l\nkm -> €", full_height/6, '/KmToEuro'),
              MainButton(Colors.blue, "Calculate based on route", full_height/6, '/Route'),
              MainButton(Colors.purple, "Set fuel price", full_height/6, '/Settings')
            ]
        )
    );
  }
}