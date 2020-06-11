import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuelcalculator/screens/MainScreen.dart';
import 'package:fuelcalculator/screens/calculators/Commons.dart';
import 'package:fuelcalculator/screens/calculators/EuroToKmCalculator.dart';
import 'package:fuelcalculator/screens/calculators/KmToEuroCalculator.dart';
import 'package:fuelcalculator/screens/calculators/LitreToKmCalculator.dart';
import 'package:fuelcalculator/screens/calculators/Per100Getter.dart';
import 'package:fuelcalculator/screens/calculators/RouteCalculator.dart';
import 'package:fuelcalculator/screens/calculators/Settings.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Commons commons = new Commons();

    return MaterialApp(

      title: 'Fuel calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Fuel calculator home'),
      routes: <String, WidgetBuilder> {
        "/EuroToKm": (context) => EuroToKmCalculator(commons),
        "/KmToEuro": (context) => KmToEuroCalculator(commons),
        "/LitreToKm": (context) => LitreToKmCalculator(commons),
        "/FuelPer100": (context) => Per100Getter(commons),
        "/Route": (context) => RouteCalculator(commons),
        "/Settings": (context) => Settings(commons),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  MainScreen _mainScreen = MainScreen();
  Widget build(BuildContext context) {
    return _mainScreen.build(context);
  }
}
