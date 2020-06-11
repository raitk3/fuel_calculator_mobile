import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';
import 'package:fuelcalculator/screens/calculators/Per100Getter.dart';

import '../TextWriter.dart';

class Settings extends StatefulWidget {
  Commons _commons;

  Settings(this._commons);

  @override
  _SettingsState createState() => _SettingsState(this._commons);
}

class _SettingsState extends State<Settings> {
  Color _theme = Colors.black26;
  Commons _commons;
  TextEditingController _controller = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  TextEditingController _controller4 = new TextEditingController();

  _SettingsState(this._commons);

  TextFormField getTextField(
      String hintText, String labelText, IconData givenIcon) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(givenIcon),
        hintText: hintText,
        labelText: labelText,
      ),
      controller: this._controller,
      onFieldSubmitted: (value) {
        this._setFuelPrice();
      },
      validator: (String value) {
        return (num.tryParse(value).toDouble() != null &&
                num.parse(value).toDouble() >= 0)
            ? 'Wrong input'
            : null;
      },
    );
  }

  TextFormField getTextField2(
      String hintText, String labelText, IconData givenIcon) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(givenIcon),
        hintText: hintText,
        labelText: labelText,
      ),
      controller: this._controller2,
      onSaved: (String value) {},
      onFieldSubmitted: (value) {
        this._setRoad();
      },
      validator: (String value) {
        return (num.tryParse(value).toDouble() != null &&
                num.parse(value).toDouble() >= 0)
            ? 'Wrong input'
            : null;
      },
    );
  }

  TextFormField getTextField3(
      String hintText, String labelText, IconData givenIcon) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(givenIcon),
        hintText: hintText,
        labelText: labelText,
      ),
      controller: this._controller3,
      onFieldSubmitted: (value) {
        this._setCity();
      },
      validator: (String value) {
        return (num.tryParse(value).toDouble() != null &&
                num.parse(value).toDouble() >= 0)
            ? 'Wrong input'
            : null;
      },
    );
  }

  TextFormField getTextField4(
      String hintText, String labelText, IconData givenIcon) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(givenIcon),
        hintText: hintText,
        labelText: labelText,
      ),
      controller: this._controller4,
      onFieldSubmitted: (value) {
        this._setAvg();
      },
      validator: (String value) {
        return (num.tryParse(value).toDouble() != null &&
                num.parse(value).toDouble() >= 0)
            ? 'Wrong input'
            : null;
      },
    );
  }

  Widget build(BuildContext context) {
    String currentFuelPrice =
        this._commons.getFuelData().getFuelPrice().toString();
    String currentRoadConsumption =
        this._commons.getFuelData().getListPer100()[0].toString();
    String currentCityConsumption =
        this._commons.getFuelData().getListPer100()[1].toString();
    String currentAverageConsumption =
        this._commons.getFuelData().getListPer100()[2].toString();
    TextFormField textField = this.getTextField(
        currentFuelPrice,
        "Uus kütuse hind. Praegu: " + currentFuelPrice + "€/l",
        Icons.euro_symbol);
    TextFormField textField2 = this.getTextField2(
        currentRoadConsumption,
        "Uus maantee kütusekulu. Praegu: " + currentRoadConsumption + "l/100",
        Icons.nature);
    TextFormField textField3 = this.getTextField3(
        currentCityConsumption,
        "Uus linna kütusekulu. Praegu: " + currentCityConsumption + "l/100",
        Icons.location_city);
    TextFormField textField4 = this.getTextField4(
        currentAverageConsumption,
        "Uus keskmine kütusekulu. Praegu: " +
            currentAverageConsumption +
            "l/100",
        Icons.nature_people);

    Per100Getter per100getter = Per100Getter(this._commons);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sätted", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: this._theme,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            textField,
            textField2,
            textField3,
            textField4,
          ]),
    );
  }

  void _setFuelPrice() {
    setState(() {});
    this
        ._commons
        .getFuelData()
        .setFuelPrice(num.parse(this._controller.text).toDouble());
    this._controller.text = "";
  }

  void _setRoad() {
    setState(() {});
    this
        ._commons
        .getFuelData()
        .setRoadConsumption(num.parse(this._controller2.text).toDouble());
    this._controller2.text = "";
  }

  void _setCity() {
    setState(() {});
    this
        ._commons
        .getFuelData()
        .setCityConsumption(num.parse(this._controller3.text).toDouble());
    this._controller3.text = "";
  }

  void _setAvg() {
    setState(() {});
    this
        ._commons
        .getFuelData()
        .setAvgConsumption(num.parse(this._controller4.text).toDouble());
    this._controller4.text = "";
  }
}
