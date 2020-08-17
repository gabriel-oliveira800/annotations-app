import 'package:annotations/data/constants.dart';
import 'package:annotations/models/tabs.dart';
import 'package:flutter/material.dart';

import 'tap_items.dart';
import 'todo_items.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool expaned = false;
  int currentPage = 0;

  void expandedItens(bool value) {
    setState(() {
      expaned = value;
    });
  }

  void changePage(int value) {
    setState(() {
      currentPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          TodoItems(),
          TabItems(
            onTap: changePage,
            expanded: expaned,
            selected: currentPage,
            expandedItens: expandedItens,
            tabs: <Tabs>[
              Tabs(
                label: 'Todos',
                color: textColor,
                isSelected: true,
                icon: Icons.home,
              ),
              Tabs(
                label: 'Events',
                color: textColor,
                isSelected: false,
                icon: Icons.calendar_today,
              ),
              Tabs(
                label: 'Account',
                color: textColor,
                isSelected: false,
                icon: Icons.account_circle,
              ),
              Tabs(
                label: 'Settings',
                color: textColor,
                isSelected: false,
                icon: Icons.settings,
              ),
              Tabs(
                label: 'Help',
                color: textColor,
                isSelected: false,
                icon: Icons.help,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
