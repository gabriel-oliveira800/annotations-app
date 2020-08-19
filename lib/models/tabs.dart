import 'package:flutter/cupertino.dart';

class Tabs {
  final int id;
  final Color color;
  final String label;
  final IconData icon;
  final Function(Tabs) ontap;

  Tabs({this.id, this.label, this.icon, this.color, this.ontap});
}
