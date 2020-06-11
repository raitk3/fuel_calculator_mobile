import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';

class LitreToKmCalculator extends StatefulWidget {
  Commons _commons;

  LitreToKmCalculator(this._commons);

  @override
  _LitreToKmCalculatorState createState() =>
      _LitreToKmCalculatorState(this._commons);
}

class _LitreToKmCalculatorState extends State<LitreToKmCalculator> {
  Color _theme = Color(0xFFB9BEA5);
  Commons _commons;
  bool _visibility = false;
  double _amountOfFuel;
  TextEditingController _controller;
  TextFormField _textField;

  _LitreToKmCalculatorState(this._commons);

  Widget build(BuildContext context) {
    this._controller = TextEditingController();
    this._textField = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.local_gas_station),
        hintText: 'Tangitud liitrid',
        labelText: "Mitu liitrit läheb?",
      ),
      controller: this._controller,
      onFieldSubmitted: (value) {
        this._visibilityMethod();
      },
      validator: (String value) {
        return (num.tryParse(value).toDouble() != null &&
                num.parse(value).toDouble() >= 0)
            ? 'Wrong input'
            : null;
      },
    );
    //TextFormField textField = this._commons.getTextField("Mitu liitrit läheb?", 'Tangitud liitrid', Icons.local_gas_station);

    return Scaffold(
      appBar: AppBar(
        title: Text("l -> km, l -> €", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: this._theme,
      ),
      body: Stack(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this._commons.getFuelData().display(),
              this._textField,
              this._commons.blank(),
              if (this._visibility &&
                  this._amountOfFuel != null &&
                  this._amountOfFuel > 0 &&
                  this._amountOfFuel < 1000000)
                this._commons.showLitresToEuros(context, this._amountOfFuel),
              this._commons.blank(),
              if (this._visibility &&
                  this._amountOfFuel != null &&
                  this._amountOfFuel > 0 &&
                  this._amountOfFuel < 1000000)
                this
                    ._commons
                    .showLitresToKilometres(context, this._amountOfFuel),
            ]),
        Flex(
          direction: Axis.vertical,
          children: <Widget>[
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
                      color: Colors.black,
                      size: 35.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
            )
          ],
        ),
      ]),
    );
  }

  void _visibilityMethod() {
    setState(() {
      if (!this._visibility) {
        this._visibility = true;
      }
    });
    this._amountOfFuel = num.parse(this._controller.text).toDouble();
    this._controller.text = "";
  }
}
