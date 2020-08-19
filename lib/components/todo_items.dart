import 'package:annotations/data/constants.dart';
import 'package:annotations/models/notes.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class TodoItems extends StatelessWidget {
  final List<Notes> notes;
  final bool hasfavorite;
  const TodoItems({Key key, this.notes, this.hasfavorite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 66.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.66,
        child: ListView.builder(
          itemCount: notes.length,
          padding: const EdgeInsets.all(6.0),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: notes[index].color ?? textColor,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              notes[index].content,
                              style: TextStyle(
                                fontSize: 22,
                                color: pupleWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            hasfavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: notes[index].color,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Divider(),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                formatDate(
                                  notes[index].dateTime,
                                  [M, ' ', d, ', ', yy],
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
