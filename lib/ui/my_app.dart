import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/mapbox_screen.dart';
import '../utils/constants/color.consts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: COLOR_PRIMARY,
        accentColor: COLOR_ACCENT,
        scaffoldBackgroundColor: COLOR_SECONDARY,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: COLOR_SECONDARY,
        ),
      ),
      home: MapBoxScreen(),
    );
  }
}
