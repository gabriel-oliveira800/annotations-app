import 'package:annotations/data/constants.dart';
import 'package:annotations/models/tabs.dart';
import 'package:flutter/material.dart';

class TabItems extends StatelessWidget {
  final int selected;
  final bool expanded;
  final Duration duration;
  final double widthContent;

  final List<Tabs> tabs;
  final Function(int) onTap;
  final Function(bool) expandedItens;

  const TabItems({
    Key key,
    this.onTap,
    this.selected = 0,
    this.expandedItens,
    @required this.tabs,
    this.expanded = false,
    this.widthContent = 60,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthContentExpanded = 230;
    final double heightContent = MediaQuery.of(context).size.height * 0.6;

    return Positioned(
      top: 0,
      left: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: AnimatedContainer(
          width: expanded ? widthContentExpanded : widthContent,
          height: heightContent,
          decoration: BoxDecoration(
            color: primaryColorLight,
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black45,
                offset: Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(
              expanded ? 18 : heightContent / 2,
            ),
          ),
          alignment: expanded ? Alignment.centerLeft : Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: expanded ? 24 : 8,
          ),
          duration: duration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(tabs.length + 1, (index) {
              if (index == tabs.length) {
                return InkWell(
                  onTap: () => expandedItens(!expanded),
                  child: Center(
                    child: Icon(
                      expanded ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                      color: pupleWhite,
                      size: heightContent / 18,
                    ),
                  ),
                );
              }

              final Tabs item = tabs[index];

              return ListTile(
                title: Text(
                  item.label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: selected == index ? pupleWhite : item.color,
                  ),
                ),
                leading: Icon(
                  item.icon,
                  size: heightContent / 14,
                  color: selected == index ? pupleWhite : item.color,
                ),
                contentPadding: expanded
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(horizontal: 8.0),
                onTap: () => onTap(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}
