import 'package:flutter/material.dart';
import 'package:fuel_calculator/calculators/Calculator.dart';
import 'package:fuel_calculator/fueldata.FuelData.dart';

import 'package:fuel_calculator/common/TextWriter.dart';

class Commons {
  FuelData _fuelData;
  Calculator _calculator;
  ThemeData _themeData = ThemeData(
      primarySwatch: Colors.indigo,
      colorScheme: ColorScheme.light(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      fontFamily: "Open Sans",
      fontFamilyFallback: ["Roboto"],
      cardColor: Colors.white12
  );


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

  ThemeData getThemeData() {
    return this._themeData;
  }

  Widget showLitresToEuros(BuildContext context, double fuel) {
    return cardify(TextWriter(
        fuel.toStringAsFixed(2) +
            "l would cost " +
            this
                ._calculator
                .calculateMoneyWithFuel(fuel, this.getFuelData().getFuelPrice())
                .toStringAsFixed(2) +
            "€.",
        _themeData.cardColor));
  }

  // ToDo: Widget list seems to be repeated a few times, simplify
  Widget showLitresToKilometres(BuildContext context, double fuel) {
    List<double> kilometres = this._calculator.calculateKmWithLitres(fuel);
    return cardify(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        TextWriter(fuel.toStringAsFixed(2) + "l would get you:",
            _themeData.cardColor),
        TextWriter("Highway: " + kilometres[0].toStringAsFixed(2) + "km.",
            _themeData.cardColor),
        TextWriter("Urban: " + kilometres[1].toStringAsFixed(2) + "km.",
            _themeData.cardColor),
        TextWriter("Average: " + kilometres[2].toStringAsFixed(2) + "km.",
            _themeData.cardColor)
      ],
    ));
  }

  Widget showKilometresToLitres(BuildContext context, double kilometres) {
    List<double> litres = this._calculator.calculateLitresWithKm(kilometres);

    return cardify(Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextWriter(kilometres.toString() + "km would consume:",
            _themeData.cardColor),
        TextWriter("Highway: " + litres[0].toStringAsFixed(2) + "l,",
            _themeData.cardColor),
        TextWriter("Urban: " + litres[1].toStringAsFixed(2) + "l,",
            _themeData.cardColor),
        TextWriter("Average: " + litres[2].toStringAsFixed(2) + "l.",
            _themeData.cardColor)
      ],
    ));
  }

  Widget showKilometresToEuros(
      BuildContext context, double kilometres, bool header) {
    List<double> litres = this
        ._calculator
        .calculateMoneyWithKm(this._fuelData.getFuelPrice(), kilometres);
    return cardify(Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (header)
          TextWriter(kilometres.toStringAsFixed(2) + "km would cost:",
              _themeData.cardColor),
        TextWriter("Highway: " + litres[0].toStringAsFixed(2) + "€,",
            _themeData.cardColor),
        TextWriter("Urban: " + litres[1].toStringAsFixed(2) + "€,",
            _themeData.cardColor),
        TextWriter("Average: " + litres[2].toStringAsFixed(2) + "€.",
            _themeData.cardColor)
      ],
    ));
  }

  Widget displayFuelPrice({Color color = Colors.white}) {
    return cardify(TextWriter("Current fuel price: " +
        this.getFuelData().getFuelPrice().toString() +
        "€/l",
        color));
  }

  Widget cardify(Widget widget){
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        margin: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this._size/1.5)
    ),
    child:widget,
    );
  }

  Widget showMoneyToLitres(double moneyGiven, double amountOfFuel) {
    return cardify(
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextWriter(
                moneyGiven.toStringAsFixed(2) +
                    "€ would get you\n" +
                    amountOfFuel.toStringAsFixed(2) +
                    "l of fuel.",
                  _themeData.cardColor)]
        ));
  }

  Widget showCombinedLitres(double road, double city) {
    double amountOfFuel = _calculator.calculateRoute(road, city);
    return cardify(TextWriter("Fuel consumed: " +
        amountOfFuel.toStringAsFixed(2) + "l.",
        _themeData.cardColor));
  }

}
