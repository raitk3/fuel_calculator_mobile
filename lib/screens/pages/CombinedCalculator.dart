import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_calculator/common/Commons.dart';

class CombinedCalculator extends StatefulWidget {
  Commons _commons;

  CombinedCalculator(this._commons);

  @override
  _CombinedCalculatorState createState() => _CombinedCalculatorState(this._commons);
}

class _CombinedCalculatorState extends State<CombinedCalculator> {
  Color _theme = Colors.deepPurpleAccent;
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

  _CombinedCalculatorState(this._commons);

  Widget build(BuildContext context) {
    _textFieldRoadController = TextEditingController();
    _textFieldCityController = TextEditingController();

    _textFieldRoad = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.nature),
        hintText: 'Highway',
        labelText: "How many km on highway?",
        border: InputBorder.none,
      ),
      controller: _textFieldRoadController,
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
    _textFieldCity = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.location_city),
        hintText: 'Urban',
        labelText: "How many km in urban environment?",
        border: InputBorder.none,
      ),
      controller: _textFieldCityController,
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
        title: Text("Combined"),
        // backgroundColor: this._theme,
      ),
      body: Stack(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _commons.displayFuelPrice(color: _theme),
              _commons.cardify(Column(
                  children:[
                    _textFieldRoad,
                    _textFieldCity])
              ),
              if (_total != null &&
                  !(_city < 0 || _road < 0) &&
                  _total > 0 &&
                  _total < 1000000)
                _commons.showCombinedLitres(_road, _city),
              if (_total != null &&
                  !(_city < 0 || this._road < 0) &&
                  _total > 0 &&
                  _total < 1000000)
                this._commons.showLitresToEuros(context, this._litres)
            ]),
      ]),
    );
  }

  void submit() {
    setState(() {
      if (!_visibility) {
        _visibility = true;
      }
    });
    _road = num.parse(_textFieldRoadController.text).toDouble();
    _city = num.parse(_textFieldCityController.text).toDouble();
    _total = _road + _city;
    _litres = _commons.getCalculator().calculateRoute(_road, _city);
    _textFieldRoadController.text = "";
    _textFieldCityController.text = "";
  }
}
