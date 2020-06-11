import 'package:flutter/material.dart';
import 'package:fuelcalculator/calculators/Calculator.dart';
import 'package:fuelcalculator/fueldata.FuelData.dart';
import 'package:fuelcalculator/screens/TextWriter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Commons.dart';

class Per100Getter extends StatelessWidget{
  Commons _commons;
  List<double> listPer100;
  Per100Getter(this._commons);

  @override
  Widget build(BuildContext context) {
    listPer100 = this._commons.getFuelData().getListPer100();
    return Scaffold(
        appBar: AppBar(
            title: Text("Info 100km kohta"),
          backgroundColor: Colors.red,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextWriter("Kütusekulu maanteel on \n" + listPer100[0].toStringAsFixed(2) + "l/100km", Colors.grey, this._commons.getSize()*2),
              TextWriter("Kütusekulu linnas on \n" + listPer100[1].toStringAsFixed(2) + "l/100km", Colors.blue, this._commons.getSize()*2),
              TextWriter("Keskmine kütusekulu on \n" + listPer100[2].toStringAsFixed(2) + "l/100km", Colors.blueGrey, this._commons.getSize()*2),

              this._commons.blank(),
              this._commons.getFuelData().display(),
              TextWriter("Maanteesõidu kulu on \n" + this._commons.getCalculator().get100kmPrice(this._commons.getFuelData().getFuelPrice())[0].toStringAsFixed(2) + "€/100km", Colors.grey, this._commons.getSize()*2),
              TextWriter("Linnasõidu kulu on \n" + this._commons.getCalculator().get100kmPrice(this._commons.getFuelData().getFuelPrice())[1].toStringAsFixed(2) + "€/100km", Colors.blue, this._commons.getSize()*2),
              TextWriter("Keskmine kulu on \n" + this._commons.getCalculator().get100kmPrice(this._commons.getFuelData().getFuelPrice())[2].toStringAsFixed(2) + "€/100km", Colors.blueGrey,this._commons.getSize()*2),
            ]
        )
    );
  }
}