import 'package:flutter/cupertino.dart';

class Tabs {
  final Color color;
  final String label;
  final IconData icon;
  final bool isSelected;

  Tabs({this.label, this.icon, this.color, this.isSelected = false});
}
