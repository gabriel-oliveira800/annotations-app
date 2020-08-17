import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/categories.dart';
import 'components/header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              Categories(),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}
