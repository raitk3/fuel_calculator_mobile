import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/calculators/Calculator.dart';
import 'package:fuelcalculator/fueldata.FuelData.dart';

import '../TextWriter.dart';

class Commons {
  TextEditingController _controller;
  TextEditingController _controller2;

  FuelData _fuelData;
  Calculator _calculator;

  Commons(){
    this._controller = TextEditingController();
    this._controller2 = new TextEditingController();
    this._fuelData = FuelData();
    this._calculator = Calculator(this);
  }


  final double _size = 50;

  double getSize(){
    return this._size;
  }

  FuelData getFuelData() {
    return this._fuelData;
  }
  TextEditingController getController() {
    return this._controller;
  }
  TextEditingController getController2() {
    return this._controller2;
  }

  Calculator getCalculator() {
    return this._calculator;
  }

  TextFormField getTextField(String hintText, String labelText, IconData givenIcon) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(givenIcon),
        hintText: hintText,
        labelText: labelText,
      ),
      controller: this._controller,
      onSaved: (String value) {
      },
      validator: (String value) {
        return (num.tryParse(value).toDouble() != null && num.parse(value).toDouble() >= 0) ? 'Wrong input' : null;
      },
    );
  }

  TextFormField getTextField2(String hintText, String labelText, IconData givenIcon) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(givenIcon),
        hintText: hintText,
        labelText: labelText,
      ),
      controller: this._controller2,
      onSaved: (String value) {
      },
      validator: (String value) {
        return (num.tryParse(value).toDouble() != null && num.parse(value).toDouble() >= 0) ? 'Wrong input' : null;
      },
    );
  }

  TextWriter showLitresToEuros(BuildContext context, double fuel) {
    return TextWriter(fuel.toStringAsFixed(2) + "l maksab " + this._calculator.calculateMoneyWithFuel(fuel, this.getFuelData().getFuelPrice()).toStringAsFixed(2) + "€.", Colors.black12, this._size);
  }

  Widget showLitresToKilometres(BuildContext context, double fuel) {
    List<double> kilometres = this._calculator.calculateKmWithLitres(fuel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextWriter(fuel.toStringAsFixed(2) + "l eest saab sõita:", Colors.green, this._size),
        TextWriter(kilometres[0].toStringAsFixed(2) + "km maanteel,", Colors.grey, this._size),
        TextWriter(kilometres[1].toStringAsFixed(2) + "km linnas,", Colors.cyan, this._size),
        TextWriter("keskmiselt " + kilometres[2].toStringAsFixed(2) + "km.", Colors.blueGrey, this._size)
      ],
    );
  }

  Widget showKilometresToLitres(BuildContext context, double kilometres) {
    List<double> litres = this._calculator.calculateLitresWithKm(kilometres);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextWriter(kilometres.toString() + "km sõiduks kulub:", Colors.green, this._size),
        TextWriter(litres[0].toStringAsFixed(2) + "l linnas,", Colors.grey, this._size),
        TextWriter(litres[1].toStringAsFixed(2) + "l maanteel,", Colors.cyan, this._size),
        TextWriter("keskmiselt " + litres[2].toStringAsFixed(2) + "l.", Colors.blueGrey, this._size)
      ],
    );
  }

  Widget showKilometresToEuros(BuildContext context, double kilometres, bool header) {
    List<double> litres = this._calculator.calculateMoneyWithKm(this._fuelData.getFuelPrice(), kilometres);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (header) TextWriter(kilometres.toStringAsFixed(2) + "km sõiduks kulub:", Colors.green, this._size),
        TextWriter(litres[0].toStringAsFixed(2) + "€ linnas,", Colors.grey, this._size),
        TextWriter(litres[1].toStringAsFixed(2) + "€ maanteel,", Colors.cyan, this._size),
        TextWriter("keskmiselt " + litres[2].toStringAsFixed(2) + "€.", Colors.blueGrey, this._size)
      ],
    );
  }

  TextWriter showMoneyToLitres(double moneyGiven, double amountOfFuel) {
    return TextWriter(moneyGiven.toStringAsFixed(2)
        + "€ eest saab\n"
        + amountOfFuel.toStringAsFixed(2)
        + "l kütust.",
    Colors.black12, this._size*2);
  }

  TextWriter showCombinedLitres(double road, double city){
    double amountOfFuel = _calculator.calculateRoute(road, city);
    return TextWriter("Kütusekulu on " + amountOfFuel.toStringAsFixed(2) + "l.", Colors.black26, this._size);
  }


  TextWriter blank() {
    return TextWriter("", null, 5);
  }

}