import 'dart:math';

import 'package:flutter/material.dart';
import 'MainButton.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    const int AMOUNT_OF_ENTRIES = 7;
    int fullHeight = MediaQuery.of(context).size.height.floor() - 92
    - AMOUNT_OF_ENTRIES * 10;
    double elementHeight = fullHeight / AMOUNT_OF_ENTRIES;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title: Text("Fuel calculator"),
        ),
        body: ListView(
            children: [
              MainButton(Colors.red,
                         "100km",
                         elementHeight,
                         '/FuelPer100',
                         Icons.flag),
              MainButton(Colors.blue,
                         "From money",
                         elementHeight,
                         '/EuroToKm',
                         Icons.euro_symbol),
              MainButton(Colors.green,
                         "From fuel",
                         elementHeight,
                         '/LitreToKm',
                         Icons.local_gas_station),
              MainButton(Colors.deepOrange,
                         "From distance",
                         elementHeight,
                         '/KmToEuro',
                         Icons.directions_car),
              MainButton(Colors.deepPurple,
                         "Combined",
                         elementHeight,
                         '/Combined',
                         Icons.directions),
              MainButton(Colors.blueGrey,
                         "Settings",
                         elementHeight,
                         '/Settings',
                         Icons.settings),
              MainButton(Colors.black,
                         "About",
                         elementHeight,
                         '/About',
                         Icons.info)
            ]
        )
    );
  }
}