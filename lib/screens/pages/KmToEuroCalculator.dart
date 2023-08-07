import 'package:flutter/material.dart';
import 'package:fuel_calculator/common/Commons.dart';

class KmToEuroCalculator extends StatefulWidget {
  Commons _commons;

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
    this._controller = TextEditingController();
    this._textField = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.directions_car),
        hintText: 'Driven amount',
        labelText: "How many km you wish to drive?",
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
        title: Text("From distance"),
      ),
      body: Stack(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this._commons.displayFuelPrice(color: _theme),
              this._commons.cardify(this._textField),
              if (this._visibility && this._kilometresDriven > 0 &&
                  this._kilometresDriven < 1000000)
                this
                    ._commons
                    .showKilometresToLitres(context, this._kilometresDriven),
              if (this._visibility && this._kilometresDriven > 0 &&
                  this._kilometresDriven < 1000000)
                this._commons.showKilometresToEuros(
                    context, this._kilometresDriven, false),
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
    this._kilometresDriven = num.parse(this._controller.text).toDouble();
    this._controller.text = "";
  }
}
