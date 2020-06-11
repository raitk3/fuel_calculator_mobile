import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';

class KmToEuroCalculator extends StatefulWidget{
  Commons _commons;
  KmToEuroCalculator(this._commons);

  @override
  _KmToEuroCalculatorState createState() => _KmToEuroCalculatorState(this._commons);
}

class _KmToEuroCalculatorState extends State<KmToEuroCalculator> {

  Color _theme = Colors.cyan;
  Commons _commons;
  bool _visibility = false;
  double _kilometresDriven = 0.0;

  _KmToEuroCalculatorState(this._commons);

  Widget build(BuildContext context) {
    TextFormField textField = this._commons.getTextField("Mitu km soovid sõita?", 'Sõidetud kilomeetrid', Icons.directions_car);

    return Scaffold(
      appBar: AppBar(
        title: Text("km -> l, km -> €"),
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
                  if (this._visibility) this._commons.showKilometresToLitres(context, this._kilometresDriven),
                  this._commons.blank(),
                  if (this._visibility && this._kilometresDriven > 0) this._commons.showKilometresToEuros(context, this._kilometresDriven, false),
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
    this._kilometresDriven = num.parse(this._commons.getController().text).toDouble();
    this._commons.getController().text = "";
  }
}