import 'package:creative_theme/creative_theme.dart';
import 'package:flutter/material.dart';

class BlueTheme extends CreativeTheme {
  static final _light = Colors.blue, _dark = Colors.lightBlue;
  BlueTheme()
      : super(
          name: 'Blue',
          primaryColor: _light,
          primarySwatch: _light,
          secondaryColor: Colors.blueAccent,
          darkPrimaryColor: _dark,
          darkSecondaryColor: Colors.lightBlueAccent,
          darkPrimarySwatch: _dark,
        );
}
