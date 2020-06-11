import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/calculators/Calculator.dart';
import 'package:fuelcalculator/fueldata.FuelData.dart';

import '../TextWriter.dart';

class Commons {
  FuelData _fuelData;
  Calculator _calculator;

  Commons() {
    this._fuelData = FuelData();
    this._calculator = Calculator(this);
  }

  final double _size = 40;

  double getSize() {
    return this._size;
  }

  FuelData getFuelData() {
    return this._fuelData;
  }

  Calculator getCalculator() {
    return this._calculator;
  }

  TextWriter showLitresToEuros(BuildContext context, double fuel) {
    return TextWriter(
        fuel.toStringAsFixed(2) +
            "l maksab " +
            this
                ._calculator
                .calculateMoneyWithFuel(fuel, this.getFuelData().getFuelPrice())
                .toStringAsFixed(2) +
            "€.",
        Colors.black12,
        this._size);
  }

  Widget showLitresToKilometres(BuildContext context, double fuel) {
    List<double> kilometres = this._calculator.calculateKmWithLitres(fuel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextWriter(fuel.toStringAsFixed(2) + "l eest saab sõita:", Colors.lightGreen,
            this._size),
        TextWriter(kilometres[0].toStringAsFixed(2) + "km maanteel,",
            Color(0xFFC5E6A6), this._size),
        TextWriter(kilometres[1].toStringAsFixed(2) + "km linnas,", Color(0xFF9899A6),
            this._size),
        TextWriter("keskmiselt " + kilometres[2].toStringAsFixed(2) + "km.",
            Color(0xFFB9BEA5), this._size)
      ],
    );
  }

  Widget showKilometresToLitres(BuildContext context, double kilometres) {
    List<double> litres = this._calculator.calculateLitresWithKm(kilometres);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextWriter(kilometres.toString() + "km sõiduks kulub:", Colors.lightGreen,
            this._size),
        TextWriter("Maanteel " + litres[0].toStringAsFixed(2) + "l,", Color(0xFFC5E6A6),
            this._size),
        TextWriter("Linnas " + litres[1].toStringAsFixed(2) + "l,", Color(0xFF9899A6),
            this._size),
        TextWriter("keskmiselt " + litres[2].toStringAsFixed(2) + "l.",
            Color(0xFFB9BEA5), this._size)
      ],
    );
  }

  Widget showKilometresToEuros(
      BuildContext context, double kilometres, bool header) {
    List<double> litres = this
        ._calculator
        .calculateMoneyWithKm(this._fuelData.getFuelPrice(), kilometres);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (header)
          TextWriter(kilometres.toStringAsFixed(2) + "km sõiduks kulub:",
              Colors.green, this._size),
        TextWriter("Maanteel " + litres[0].toStringAsFixed(2) + "€,", Color(0xFFC5E6A6),
            this._size),
        TextWriter("Linnas " + litres[1].toStringAsFixed(2) + "€,", Color(0xFF9899A6),
            this._size),
        TextWriter("keskmiselt " + litres[2].toStringAsFixed(2) + "€.",
            Color(0xFFB9BEA5), this._size)
      ],
    );
  }

  TextWriter showMoneyToLitres(double moneyGiven, double amountOfFuel) {
    return TextWriter(
        moneyGiven.toStringAsFixed(2) +
            "€ eest saab\n" +
            amountOfFuel.toStringAsFixed(2) +
            "l kütust.",
        Colors.black12,
        this._size * 2);
  }

  TextWriter showCombinedLitres(double road, double city) {
    double amountOfFuel = _calculator.calculateRoute(road, city);
    return TextWriter("Kütusekulu on " + amountOfFuel.toStringAsFixed(2) + "l.",
        Colors.black26, this._size);
  }

  TextWriter blank() {
    return TextWriter("", null, 5);
  }
}
