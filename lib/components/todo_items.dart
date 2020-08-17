import 'package:annotations/data/constants.dart';
import 'package:flutter/material.dart';

class TodoItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 66.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: 55,
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SizedBox(
                height: 120,
                child: Card(
                  color: textColor,
                  margin: EdgeInsets.zero,
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        color: pupleWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
