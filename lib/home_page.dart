import 'package:annotations/models/notes.dart';
import 'package:flutter/material.dart';

import 'components/add_content.dart';
import 'models/tabs.dart';
import 'data/constants.dart';

import 'components/header.dart';
import 'components/tap_items.dart';
import 'components/categories.dart';
import 'components/todo_items.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;
  int currentPage = 0;
  bool expaned = false;
  PageController pageController;
  final textController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void nextPage(int page) {
    pageController.jumpToPage(page);
  }

  void addNotes() {
    scaffoldKey.currentState.showBottomSheet(
      (_) => AddContent(
        selected: selected,
        chandeColor: (value) {
          setState(() {
            selected = value;
          });
        },
        controller: textController,
        addNotes: (n) {
          setState(() {
            notes.add(n);
          });
        },
      ),
    );
  }

  List<Notes> notes = [
    Notes(
      id: 0,
      color: Colors.purple[200],
      dateTime: DateTime.now(),
      content: 'Add card in home and get children',
    ),
    Notes(
      id: 0,
      color: Colors.blue[400],
      dateTime: DateTime.now(),
      content: '10 UI and UX Lessons from Designing My own Project',
    ),
    Notes(
      id: 0,
      color: Colors.purple,
      dateTime: DateTime.now(),
      content: '10 UI and UX Lessons from Designing My own Project',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            Header(
              urlImage: urlImage,
              onPressed: addNotes,
            ),
            Categories(),
            Container(
              width: size.width,
              height: size.height * 0.66,
              child: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    children: [
                      TodoItems(notes: notes, hasfavorite: true),
                      TodoItems(notes: notes, hasfavorite: false),
                      TodoItems(notes: notes, hasfavorite: true),
                      TodoItems(notes: notes, hasfavorite: false),
                    ],
                  ),
                  TabItems(
                    tabs: <Tabs>[
                      Tabs(
                        id: 0,
                        label: 'Notes',
                        color: textColor,
                        icon: Icons.home,
                      ),
                      Tabs(
                        id: 1,
                        label: 'Events',
                        color: textColor,
                        icon: Icons.calendar_today,
                      ),
                      Tabs(
                        id: 2,
                        label: 'Account',
                        color: textColor,
                        icon: Icons.account_circle,
                      ),
                      Tabs(
                        id: 3,
                        label: 'Favorite',
                        color: textColor,
                        icon: Icons.favorite,
                      ),
                      Tabs(
                        id: 4,
                        label: 'Settings',
                        color: textColor,
                        icon: Icons.settings,
                      ),
                    ],
                    onTap: (value) {
                      setState(() {
                        currentPage = value;
                      });

                      nextPage(currentPage);
                    },
                    expanded: expaned,
                    selected: currentPage,
                    expandedItens: (value) {
                      setState(() {
                        expaned = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
