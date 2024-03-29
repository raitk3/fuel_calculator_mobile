import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:fuel_calculator/common/Commons.dart';

import '../../common/TextWriter.dart';

class About extends StatefulWidget {
  Commons _commons;

  About(this._commons);

  @override
  _AboutState createState() => _AboutState(this._commons);
}

class _AboutState extends State<About> {
  Commons _commons;

  _AboutState(this._commons);

  @override
  Widget build(BuildContext context) {
    String version = "0.2.0";
    Future<PackageInfo> packageInfo = PackageInfo.fromPlatform();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("About"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _commons.cardify(Column(
                children:[TextWriter(
                    "Version " + version,
                    _commons.getThemeData().cardColor),
                  TextWriter(
                      "Made by Rait Kulbok",
                      _commons.getThemeData().cardColor),
                ],))
            ]));
  }
}
