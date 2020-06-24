import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/TextWriter.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FuelData {
  double _price;
  double _road;
  double _city;
  double _average;

  FuelData() {
    this._getData();
  }

  double getFuelPrice() {
    return this._price;
  }

  List<double> getListPer100() {
    return [_road, _city, _average];
  }

  Future<bool> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('price')) {
      prefs.setDouble('price', 1.179);
    }
    this._price = prefs.getDouble('price');

    if (!prefs.containsKey('city')) {
      prefs.setDouble('city', 11.6);
    }
    this._city= prefs.getDouble('city');

    if (!prefs.containsKey('road')) {
      prefs.setDouble('road', 6.5);
    }
    this._road = prefs.getDouble('road');

    if (!prefs.containsKey('avg')) {
      prefs.setDouble('avg', 8.2);
    }
    this._average = prefs.getDouble('avg');

    await SharedPreferences.getInstance();
  }

  Future<void> setFuelPrice(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value > 0 && value <= 100) {
      this._price = num.parse(value.toStringAsFixed(3)).toDouble();
      prefs.setDouble('price', value);
    }
  }
  Future<void> setRoadConsumption(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value > 0 && value <= 100) {
      this._road = num.parse(value.toStringAsFixed(3)).toDouble();
      prefs.setDouble('road', value);
    }
  }
  Future<void> setCityConsumption(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value > 0 && value <= 100) {
      this._city = num.parse(value.toStringAsFixed(3)).toDouble();
      prefs.setDouble('city', value);
    }
  }
  Future<void> setAvgConsumption(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value > 0 && value <= 100) {
      this._average = num.parse(value.toStringAsFixed(3)).toDouble();
      prefs.setDouble('avg', value);
    }
  }

}