import 'package:annotations/data/constants.dart';
import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 28,
            color: textColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        Text(
          'Back',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
