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
  Color _theme = Colors.green;
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
        border: InputBorder.none,
      ),
      controller: this._controller,
      onFieldSubmitted: (value) {
        this.submit();
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
        centerTitle: true,
        title: Text("l -> km, l -> €"),
        backgroundColor: this._theme,
      ),
      body: Stack(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this._commons.displayFuelPrice(),
              this._commons.cardify(this._textField),
              if (this._visibility &&
                  this._amountOfFuel != null &&
                  this._amountOfFuel > 0 &&
                  this._amountOfFuel < 1000000)
                this._commons.showLitresToEuros(context, this._amountOfFuel),
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
                      this.submit();
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

  void submit() {
    setState(() {
      if (!this._visibility) {
        this._visibility = true;
      }
    });
    this._amountOfFuel = num.parse(this._controller.text).toDouble();
    this._controller.text = "";
  }
}
