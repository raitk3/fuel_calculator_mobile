import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuel_calculator/screens/MainScreen.dart';
import 'package:fuel_calculator/common/Commons.dart';
// TODO: Single import?
import 'package:fuel_calculator/screens/pages/EuroToKmCalculator.dart';
import 'package:fuel_calculator/screens/pages/KmToEuroCalculator.dart';
import 'package:fuel_calculator/screens/pages/LitreToKmCalculator.dart';
import 'package:fuel_calculator/screens/pages/Per100Getter.dart';
import 'package:fuel_calculator/screens/pages/CombinedCalculator.dart';
import 'package:fuel_calculator/screens/pages/Settings.dart';
import 'package:fuel_calculator/screens/pages/About.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(FuelCalculatorApp());
}


class FuelCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Commons commons = new Commons();

    return
      MaterialApp(
      title: 'Fuel calculator',
      theme: commons.getThemeData(),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        systemNavigationBarColor: Colors.transparent, // navigation bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
      ),
        child:HomePage(title: 'Fuel calculator home'),
      ),
      routes: <String, WidgetBuilder> {
        "/EuroToKm": (context) => EuroToKmCalculator(commons),
        "/KmToEuro": (context) => KmToEuroCalculator(commons),
        "/LitreToKm": (context) => LitreToKmCalculator(commons),
        "/FuelPer100": (context) => Per100Getter(commons),
        "/Combined": (context) => CombinedCalculator(commons),
        "/Settings": (context) => Settings(commons),
        "/About": (context) => About(commons),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainScreen _mainScreen = MainScreen();
  @override
  Widget build(BuildContext context) {
    return _mainScreen.build(context);
  }
}
