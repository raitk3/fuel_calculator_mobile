import 'package:flutter/material.dart';
import 'package:fuel_calculator/common/TextWriter.dart';
import 'package:fuel_calculator/common/Commons.dart';

class Per100Getter extends StatelessWidget {
  final Commons _commons;
  final Color _theme = Colors.redAccent;

  Per100Getter(this._commons);

  @override
  Widget build(BuildContext context) {
    List<double> listPer100 = this._commons.getFuelData().getListPer100();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Info about 100km"),
          // backgroundColor: _theme,
        ),
        drawer: _commons.getHamburgerMenu(1),
        body: ListView(
            children: [
              this._commons.displayFuelPrice(color: _theme),
              this._commons.cardify(Column(
                children:[TextWriter(
                  "Highway consumption:\n" +
                      listPer100[0].toStringAsFixed(2) +
                      "l/100km",
                    _commons.getThemeData().cardColor),
              TextWriter(
                  "Urban consumption:\n" +
                      listPer100[1].toStringAsFixed(2) +
                      "l/100km",
                  _commons.getThemeData().cardColor),
              TextWriter(
                  "Average consumption:\n" +
                      listPer100[2].toStringAsFixed(2) +
                      "l/100km",
                  _commons.getThemeData().cardColor)
                ],
          )),
          this._commons.cardify(Column(
            children:[
              TextWriter(
              "Highway:\n" +
                this._commons
                    .getCalculator()
                    .get100kmPrice(
                        this._commons.getFuelData().getFuelPrice())[0]
                    .toStringAsFixed(2) +
                  "€/100km",
                  _commons.getThemeData().cardColor),
              TextWriter(
                "Urban:\n" +
                    this._commons
                        .getCalculator()
                        .get100kmPrice(
                            this._commons.getFuelData().getFuelPrice())[1]
                        .toStringAsFixed(2) +
                    "€/100km",
                  _commons.getThemeData().cardColor),
              TextWriter(
                "Average:\n" +
                    this._commons
                        .getCalculator()
                        .get100kmPrice(
                            this._commons.getFuelData().getFuelPrice())[2]
                        .toStringAsFixed(2) +
                    "€/100km",
                  _commons.getThemeData().cardColor),
          ],))
        ]));
  }
}
