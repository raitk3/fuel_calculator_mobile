import 'package:flutter/material.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';

class Calculator {
  Commons _commons;
  Calculator(this._commons);

  List calculateKmWithLitres(double amountOfFuel){
    List<double> returnable = List();
    this._commons.getFuelData().getListPer100().forEach((element) {returnable.add(amountOfFuel / element * 100);});
    return returnable;
  }

  List get100kmPrice(fuelPrice) {
    return this._commons.getFuelData().getListPer100().map((e) => e * fuelPrice).toList();
  }

  double calculateFuelWithMoney(double moneyGiven, double fuelPrice) {
    return moneyGiven / fuelPrice;
  }

  double calculateMoneyWithFuel(double fuel, double fuelPrice) {
    return fuel * fuelPrice;
  }

  List calculate1kmFuel() {
    return this._commons.getFuelData().getListPer100().map((e) => e / 100).toList();
  }

  List calculateLitresWithKm(double kilometres){
    List<double> returnable = List();
    List<double> kmFuels = this.calculate1kmFuel();
    kmFuels.forEach((element) {returnable.add(element * kilometres);});
    return returnable;
  }

  List calculateMoneyWithKm(fuelPrice, kilometres){
    List<double> returnable = List();
    List<double> amountOfFuel = calculate1kmFuel();
    amountOfFuel.forEach((element) {returnable.add(element * kilometres * fuelPrice);});
    return returnable;
  }


  calculateRoute(roadKm, cityKm){
    List kmFuels = calculate1kmFuel();
    return (roadKm * kmFuels.elementAt(0) + cityKm * kmFuels.elementAt(1));
  }
}
