import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';

class RouteCalculator extends StatefulWidget {
  Commons _commons;

  RouteCalculator(this._commons);

  @override
  _RouteCalculatorState createState() => _RouteCalculatorState(this._commons);
}

class _RouteCalculatorState extends State<RouteCalculator> {
  Color _theme = Color(0xFF9899A6);
  Commons _commons;
  TextEditingController _textFieldRoadController;
  TextEditingController _textFieldCityController;
  TextFormField _textFieldRoad;
  TextFormField _textFieldCity;
  bool _visibility = false;
  double _road;
  double _city;
  double _total;
  double _litres;

  _RouteCalculatorState(this._commons);

  Widget build(BuildContext context) {
    this._textFieldRoadController = TextEditingController();
    this._textFieldCityController = TextEditingController();

    this._textFieldRoad = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.nature),
        hintText: 'Maantee',
        labelText: "Mitu km tuleb maanteel?",
      ),
      controller: this._textFieldRoadController,
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
    this._textFieldCity = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.location_city),
        hintText: 'Linn',
        labelText: "Mitu km tuleb linnas?",
      ),
      controller: this._textFieldCityController,
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Teekond", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: this._theme,
      ),
      body: Stack(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this._commons.getFuelData().display(),
              this._textFieldRoad,
              this._textFieldCity,
              if (this._total != null &&
                  !(this._city < 0 || this._road < 0) &&
                  this._total > 0 &&
                  this._total < 1000000)
                this._commons.showCombinedLitres(this._road, this._city),
              if (this._total != null &&
                  !(this._city < 0 || this._road < 0) &&
                  this._total > 0 &&
                  this._total < 1000000)
                this._commons.showLitresToEuros(context, this._litres)
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
    this._road = num.parse(this._textFieldRoadController.text).toDouble();
    this._city = num.parse(this._textFieldCityController.text).toDouble();
    this._total = this._road + this._city;
    this._litres =
        this._commons.getCalculator().calculateRoute(this._road, this._city);
    this._textFieldRoadController.text = "";
    this._textFieldCityController.text = "";
  }
}
