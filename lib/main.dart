import 'package:flutter/material.dart';
import 'data/constants.dart';
import 'home_page.dart';

void main() => runApp(Annotations());

class Annotations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annotations',
      theme: ThemeData(
        fontFamily: 'Poppins',
        accentColor: accentColor,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
