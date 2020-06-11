import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';

class LitreToKmCalculator extends StatefulWidget{

  Commons _commons;
  LitreToKmCalculator(this._commons);

  @override
  _LitreToKmCalculatorState createState() => _LitreToKmCalculatorState(this._commons);
}

class _LitreToKmCalculatorState extends State<LitreToKmCalculator> {

  Color _theme = Colors.green;
  Commons _commons;
  bool _visibility = false;
  double _amountOfFuel;

  _LitreToKmCalculatorState(this._commons);

  Widget build(BuildContext context) {
    TextFormField textField = this._commons.getTextField("Mitu liitrit läheb?", 'Tangitud liitrid', Icons.local_gas_station);

    return Scaffold(
      appBar: AppBar(
        title: Text("l -> km, l -> €"),
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
                  if (this._visibility && this._amountOfFuel != null && this._amountOfFuel > 0) this._commons.showLitresToEuros(context, this._amountOfFuel),
                  this._commons.blank(),
                  if (this._visibility && this._amountOfFuel != null && this._amountOfFuel > 0) this._commons.showLitresToKilometres(context, this._amountOfFuel),
                ]),
            Expanded(
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
    this._amountOfFuel = num.parse(this._commons.getController().text).toDouble();
    this._commons.getController().text = "";
  }
}