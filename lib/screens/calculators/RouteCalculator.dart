import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';

class RouteCalculator extends StatefulWidget{
  Commons _commons;
  RouteCalculator(this._commons);
  @override
  _RouteCalculatorState createState() => _RouteCalculatorState(this._commons);
}

class _RouteCalculatorState extends State<RouteCalculator> {

  Color _theme = Colors.blue;
  Commons _commons;
  bool _visibility = false;
  double _road;
  double _city;
  double _total;
  double _litres;

  _RouteCalculatorState(this._commons);

  Widget build(BuildContext context) {
    TextFormField textFieldRoad = this._commons.getTextField("Mitu km tuleb maanteel?", 'Maantee', Icons.nature);
    TextFormField textFieldCity = this._commons.getTextField2("Mitu km tuleb linnas?", 'Linn', Icons.location_city);

    return Scaffold(
      appBar: AppBar(
        title: Text("Route"),
        backgroundColor: this._theme,

      ),
      body: Stack(
          children: <Widget> [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  this._commons.getFuelData().display(),
                  textFieldRoad,
                  textFieldCity,
                  if (this._total != null && !(this._city < 0 || this._road < 0) && this._total > 0) this._commons.showCombinedLitres(this._road, this._city),
                  if (this._total != null && !(this._city < 0 || this._road < 0) && this._total > 0)this._commons.showLitresToEuros(context, this._litres)
                ]),
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
                      color: Colors.white,
                      size: 35.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )
              ),
            ),
          ]),
    );
  }

  void _visibilityMethod() {
    setState(() {
      if (!this._visibility) {
        this._visibility = true;
      }
    }
    );
    this._road = num.parse(this._commons.getController().text).toDouble();
    this._city = num.parse(this._commons.getController2().text).toDouble();
    this._total = this._road + this._city;
    this._litres = this._commons.getCalculator().calculateRoute(this._road, this._city);
    this._commons.getController().text = "";
    this._commons.getController2().text = "";
  }
}