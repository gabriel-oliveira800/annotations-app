import 'package:annotations/data/constants.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentPage = 0;
  final List<String> categories = [
    'All',
    'Music',
    'Events',
    'Calendar',
    'Food',
    'Photos',
  ];

  void changePage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: size.width,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () => changePage(index),
              child: Container(
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  categories[index].toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: currentPage == index ? pupleWhite : textColor,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
