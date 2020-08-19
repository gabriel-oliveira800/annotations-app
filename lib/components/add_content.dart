import 'package:annotations/data/constants.dart';
import 'package:annotations/models/notes.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class AddContent extends StatelessWidget {
  final int selected;
  final Function(Notes) addNotes;
  final Function(int) chandeColor;
  final TextEditingController controller;

  const AddContent({
    Key key,
    this.addNotes,
    this.controller,
    this.selected = 0,
    this.chandeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      elevation: 8,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Content',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getColors(Colors.red, 0, selected: selected == 0),
                        getColors(Colors.blue, 1, selected: selected == 1),
                        getColors(Colors.yellow, 2, selected: selected == 2),
                        getColors(Colors.brown, 3, selected: selected == 3),
                        getColors(Colors.green, 4, selected: selected == 4),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2030, 12, 31),
                            );
                          },
                          color: secundaryColor,
                          child: Text(
                            'select date',
                            style: TextStyle(color: pupleWhite),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            formatDate(
                              DateTime.now(),
                              [D, ' ', M, ' ', yyyy],
                            ),
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlineButton.icon(
                    onPressed: () {
                      addNotes(
                        Notes(
                          id: 0,
                          color: Colors.purple,
                          dateTime: DateTime.now(),
                          content: controller.text ??
                              '10 UI and UX Lessons from Designing My own Project',
                        ),
                      );
                      Navigator.pop(context);
                    },
                    color: pupleWhite,
                    icon: Icon(Icons.add, color: secundaryColor),
                    label: Text(
                      'add note',
                      style: TextStyle(color: secundaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onClosing: () {},
    );
  }

  Widget getColors(Color color, int index, {bool selected = false}) {
    final double height = selected ? 30 : 20;

    return InkWell(
      onTap: () => chandeColor(index),
      child: Container(
        width: height,
        height: height,
        padding: selected ? const EdgeInsets.all(2.5) : null,
        decoration: BoxDecoration(
          border: selected ? Border.all(width: 1.7, color: textColor) : null,
          shape: BoxShape.circle,
        ),
        child: Container(
          width: height,
          height: height,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
