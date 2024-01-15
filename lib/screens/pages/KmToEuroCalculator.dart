import 'package:flutter/material.dart';
import 'package:fuel_calculator/common/Commons.dart';

class KmToEuroCalculator extends StatefulWidget {
  final Commons _commons;

  KmToEuroCalculator(this._commons);

  @override
  _KmToEuroCalculatorState createState() =>
      _KmToEuroCalculatorState(this._commons);
}

class _KmToEuroCalculatorState extends State<KmToEuroCalculator> {
  Color _theme = Colors.deepOrangeAccent;
  Commons _commons;
  bool _visibility = false;
  double _kilometresDriven = 0.0;
  TextEditingController _controller;
  TextFormField _textField;

  _KmToEuroCalculatorState(this._commons);

  Widget build(BuildContext context) {
    _controller = TextEditingController();
    _textField = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.directions_car),
        hintText: 'Driven amount',
        labelText: "How many km you wish to drive?",
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
        title: Text("From distance"),
      ),
      body: ListView(
        children: <Widget>[
          _commons.displayFuelPrice(color: _theme),
          _commons.cardify(_textField),
          if (_visibility && _kilometresDriven > 0 &&
              _kilometresDriven < 1000000)
            _commons.showKilometresToLitres(context, _kilometresDriven),
          if (_visibility && _kilometresDriven > 0 &&
              _kilometresDriven < 1000000)
            _commons.showKilometresToEuros(
                context, _kilometresDriven, false),
      ]),
    );
  }

  void submit() {
    setState(() {
      if (!_visibility) {
        _visibility = true;
      }
    });
    _kilometresDriven = num.parse(_controller.text).toDouble();
  }
}
