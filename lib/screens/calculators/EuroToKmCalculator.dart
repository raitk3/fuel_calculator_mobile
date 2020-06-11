import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';
import 'package:fuelcalculator/screens/calculators/LitreToKmCalculator.dart';

class EuroToKmCalculator extends StatefulWidget{
  final Commons _commons;
  EuroToKmCalculator(this._commons);

  @override
  _EuroToKmCalculatorState createState() => _EuroToKmCalculatorState(this._commons);
}

class _EuroToKmCalculatorState extends State<EuroToKmCalculator> {

  Color _theme = Colors.orange;
  Commons _commons;
  LitreToKmCalculator litreToKmCalculator;
  bool _visibility = false;
  double _moneyGiven = 0.0;
  double _amountOfFuel;

  _EuroToKmCalculatorState(this._commons);

  Widget build(BuildContext context) {
    litreToKmCalculator = LitreToKmCalculator(_commons);
    TextFormField textField = this._commons.getTextField("Mitme euro eest soovid kütust osta?", 'Makstud raha', Icons.euro_symbol);

    return Scaffold(
        appBar: AppBar(
          title: Text("€ -> l, € -> km"),
          backgroundColor: this._theme,

        ),
      body: Stack(
          children: <Widget> [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  this._commons.getFuelData().display(),
                  textField,
                  this._commons.blank(),
                  if (this._visibility) this._commons.showMoneyToLitres(this._moneyGiven, this._amountOfFuel),
                  this._commons.blank(),
                  if (this._visibility && this._amountOfFuel != null && this._amountOfFuel > 0) this._commons.showLitresToKilometres(context, this._amountOfFuel),
              ]),
                Flex(
                  direction: Axis.vertical,
                  children: <Widget> [Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: RaisedButton(
                          onPressed: () {
                          this._visibilityMethod();
                          },
                          elevation: 2.0,
                          color: this._theme,
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 35.0,
                            ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        )
                      ),
                    )],
                  ),
                ]),
              );
            }

  void _visibilityMethod() {
    setState(() {
      if (!this._visibility) {
        this._visibility = true;
      }
    }
    );
    this._moneyGiven = num.parse(this._commons.getController().text).toDouble();
    this._amountOfFuel = num.parse(
        this._commons
            .getCalculator()
            .calculateFuelWithMoney(this._moneyGiven, this._commons.getFuelData().getFuelPrice())
            .toStringAsFixed(2))
            .toDouble();
    this._commons.getController().text = "";
  }
}