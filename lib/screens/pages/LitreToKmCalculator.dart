import 'package:flutter/material.dart';
import 'package:fuel_calculator/common/Commons.dart';

class LitreToKmCalculator extends StatefulWidget {
  final Commons _commons;

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
    _controller = TextEditingController();
    _textField = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.local_gas_station),
        hintText: 'Fuel amount',
        labelText: "How many liters?",
        border: InputBorder.none,
      ),
      controller: _controller,
      onFieldSubmitted: (value) {
        submit();
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
      drawer: _commons.getHamburgerMenu(3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _commons.displayFuelPrice(color: _theme),
          _commons.cardify(this._textField),
          if (_visibility &&
              _amountOfFuel != null &&
              _amountOfFuel > 0 &&
              _amountOfFuel < 1000000)
            _commons.showLitresToEuros(context, _amountOfFuel),
          if (_visibility &&
              _amountOfFuel != null &&
              _amountOfFuel > 0 &&
              _amountOfFuel < 1000000)
            _commons.showLitresToKilometres(context, _amountOfFuel),
        ]),
    );
  }

  void submit() {
    setState(() {
      if (!_visibility) {
        _visibility = true;
      }
    });
    _amountOfFuel = num.parse(_controller.text).toDouble();
  }
}
