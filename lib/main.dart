import 'package:flutter/material.dart';
import 'data/constants.dart';

void main() => runApp(Annotations());

class Annotations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annotations',
      theme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: accentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
      debugShowCheckedModeBanner: false,
    );
  }
}
