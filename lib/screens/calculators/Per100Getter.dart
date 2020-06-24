import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/TextWriter.dart';

import 'Commons.dart';

class Per100Getter extends StatelessWidget {
  Commons _commons;
  List<double> listPer100;

  Per100Getter(this._commons);

  @override
  Widget build(BuildContext context) {
    listPer100 = this._commons.getFuelData().getListPer100();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Info 100km kohta",),
          backgroundColor: Colors.red,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          this._commons.cardify(Column(
            children:[TextWriter(
              "Kütusekulu maanteel on \n" +
                  listPer100[0].toStringAsFixed(2) +
                  "l/100km",
              Color(0xFFC5E6A6),
              this._commons.getSize() * 2),
          TextWriter(
              "Kütusekulu linnas on \n" +
                  listPer100[1].toStringAsFixed(2) +
                  "l/100km",
              Color(0xFF9899A6),
              this._commons.getSize() * 2),
          TextWriter(
              "Keskmine kütusekulu on \n" +
                  listPer100[2].toStringAsFixed(2) +
                  "l/100km",
              Color(0xFFB9BEA5),
              this._commons.getSize() * 2)],
          )),

          this._commons.displayFuelPrice(),
          this._commons.cardify(Column(
            children:[
              TextWriter(
              "Maanteesõidu kulu on \n" +
                  this
                      ._commons
                      .getCalculator()
                      .get100kmPrice(
                          this._commons.getFuelData().getFuelPrice())[0]
                      .toStringAsFixed(2) +
                  "€/100km",
              Color(0xFFC5E6A6),
              this._commons.getSize() * 2),
            TextWriter(
              "Linnasõidu kulu on \n" +
                  this
                      ._commons
                      .getCalculator()
                      .get100kmPrice(
                          this._commons.getFuelData().getFuelPrice())[1]
                      .toStringAsFixed(2) +
                  "€/100km",
              Color(0xFF9899A6),
              this._commons.getSize() * 2),
            TextWriter(
              "Keskmine kulu on \n" +
                  this
                      ._commons
                      .getCalculator()
                      .get100kmPrice(
                          this._commons.getFuelData().getFuelPrice())[2]
                      .toStringAsFixed(2) +
                  "€/100km",
              Color(0xFFB9BEA5),
              this._commons.getSize() * 2),
          ],))
        ]));
  }
}
