import 'package:flutter/material.dart';
import 'package:weather_app_v2/details_view.dart';
import 'package:weather_app_v2/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black
        )

      )
    ),
    home: Homeview(),
  ));
}
