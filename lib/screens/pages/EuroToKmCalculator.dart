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
      controller: _controller,
      onFieldSubmitted: (value) {
        _submit();
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
      drawer: _commons.getHamburgerMenu(2),
      body: ListView(
            children: <Widget>[
              _commons.displayFuelPrice(color: _theme),
              _commons.cardify(this._textField),
              if (_visibility &&
                  _amountOfFuel > 0 &&
                  _amountOfFuel < 1000000)
                _commons.showMoneyToLitres(_moneyGiven, _amountOfFuel),
              if (_visibility &&
                  _amountOfFuel != null &&
                  _amountOfFuel > 0 &&
                  _amountOfFuel < 1000000)
                _commons.showLitresToKilometres(context, _amountOfFuel),
            ]),
    );
  }

  void _submit() {
    setState(() {
      if (!_visibility) {
        _visibility = true;
      }
    });
    _moneyGiven = num.parse(_controller.text).toDouble();
    _amountOfFuel = num.parse(_commons.getCalculator()
      .calculateFuelWithMoney(_moneyGiven, _commons.getFuelData()
                                                   .getFuelPrice())
      .toStringAsFixed(2))
      .toDouble();
  }
}
