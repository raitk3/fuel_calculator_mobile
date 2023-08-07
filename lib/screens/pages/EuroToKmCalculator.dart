import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_calculator/common/Commons.dart';
import 'package:fuel_calculator/screens/pages/LitreToKmCalculator.dart';

class EuroToKmCalculator extends StatefulWidget {
  final Commons _commons;

  EuroToKmCalculator(this._commons);

  @override
  _EuroToKmCalculatorState createState() =>
      _EuroToKmCalculatorState(this._commons);
}

class _EuroToKmCalculatorState extends State<EuroToKmCalculator> {
  Color _theme = Colors.blueAccent;
  TextFormField _textField;
  TextEditingController _controller;
  Commons _commons;
  LitreToKmCalculator litreToKmCalculator;
  bool _visibility = false;
  double _moneyGiven = 0.0;
  double _amountOfFuel;

  _EuroToKmCalculatorState(this._commons);

  Widget build(BuildContext context) {
    litreToKmCalculator = LitreToKmCalculator(_commons);

    this._controller = TextEditingController();
    this._textField = TextFormField(
      keyboardType: TextInputType.number,

      decoration: InputDecoration(
        icon: Icon(Icons.euro_symbol),
        hintText: 'Amount of money',
        labelText: "How many euros worth of fuel did you buy?",
        border: InputBorder.none,
      ),
      controller: this._controller,
      onFieldSubmitted: (value) {
        this._submit();
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
        title: Text("From money"),
      ),
      body: Stack(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this._commons.displayFuelPrice(color: _theme),
              this._commons.cardify(this._textField),
              if (this._visibility &&
                  this._amountOfFuel > 0 &&
                  this._amountOfFuel < 1000000)
                this._commons
                    .showMoneyToLitres(this._moneyGiven, this._amountOfFuel),
              if (this._visibility &&
                  this._amountOfFuel != null &&
                  this._amountOfFuel > 0 &&
              this._amountOfFuel < 1000000)
                this._commons
                    .showLitresToKilometres(context, this._amountOfFuel),
            ]),
      ]),
    );
  }

  void _submit() {
    setState(() {
      if (!this._visibility) {
        this._visibility = true;
      }
    });
    this._moneyGiven = num.parse(this._controller.text).toDouble();
    this._amountOfFuel = num.parse(this
            ._commons
            .getCalculator()
            .calculateFuelWithMoney(
                this._moneyGiven, this._commons.getFuelData().getFuelPrice())
            .toStringAsFixed(2))
        .toDouble();
    this._controller.text = "";
  }
}
