import 'package:annotations/data/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String url;
  final double radius;
  final bool hasBorder;
  final Color borderColor;

  const Profile({
    Key key,
    this.radius = 20,
    this.borderColor,
    @required this.url,
    this.hasBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: hasBorder
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor ?? pupleWhite, width: 1.5),
            )
          : null,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
