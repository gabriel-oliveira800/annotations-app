import 'package:annotations/components/profile.dart';
import 'package:annotations/data/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String urlImage =
      'https://images.unsplash.com/photo-1516726817505-f5ed825624d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.19,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Profile(url: urlImage, radius: 28),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello,',
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: ' Joana Robins',
                        style: TextStyle(
                          color: pupleWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Gerencie suas tarefas',
                  style: TextStyle(
                    color: textColor,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.search,
            size: 34,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
