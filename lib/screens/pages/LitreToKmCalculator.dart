import 'package:flutter/material.dart';
import 'package:fuel_calculator/common/Commons.dart';

class LitreToKmCalculator extends StatefulWidget {
  Commons _commons;

  LitreToKmCalculator(this._commons);

  @override
  _LitreToKmCalculatorState createState() =>
      _LitreToKmCalculatorState(this._commons);
}

class _LitreToKmCalculatorState extends State<LitreToKmCalculator> {
  Color _theme = Colors.greenAccent;
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
        hintText: 'Fuel amount',
        labelText: "How many liters?",
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("From fuel"),
      ),
      body: Stack(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this._commons.displayFuelPrice(color: _theme),
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
