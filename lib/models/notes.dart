import 'package:flutter/material.dart';

class Notes {
  final int id;
  final String content;
  final Function(Notes) ontap;

  final Color color;
  final DateTime dateTime;

  Notes({
    this.id,
    this.color,
    this.content,
    this.ontap,
    this.dateTime,
  });
}
