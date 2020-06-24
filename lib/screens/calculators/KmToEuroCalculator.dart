import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';

class KmToEuroCalculator extends StatefulWidget {
  Commons _commons;

  KmToEuroCalculator(this._commons);

  @override
  _KmToEuroCalculatorState createState() =>
      _KmToEuroCalculatorState(this._commons);
}

class _KmToEuroCalculatorState extends State<KmToEuroCalculator> {
  Color _theme = Colors.deepOrange;
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
        hintText: 'Sõidetud kilomeetrid',
        labelText: "Mitu km soovid sõita?",
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
        title: Text("km -> l, km -> €"),
        backgroundColor: this._theme,
      ),
      body: Stack(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this._commons.displayFuelPrice(),
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
    this._kilometresDriven = num.parse(this._controller.text).toDouble();
    this._controller.text = "";
  }
}
