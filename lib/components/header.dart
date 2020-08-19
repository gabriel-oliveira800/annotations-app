import 'package:annotations/components/profile.dart';
import 'package:annotations/data/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String urlImage;
  final Function onPressed;

  const Header({Key key, @required this.urlImage, this.onPressed})
      : super(key: key);

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
                  'Good morning',
                  style: TextStyle(
                    color: textColor,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 28,
              color: textColor,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
