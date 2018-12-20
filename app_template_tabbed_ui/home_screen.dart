import 'package:flutter/material.dart';
import 'first_tab.dart';
import 'second_tab.dart';

////===========================================================================
//// Material app with tab bar on BOTTOM
//// We use BottomNavigationBar
//// Need to implement navigation
//// https://stackoverflow.com/questions/52598900/flutter-bottomnavigationbar-rebuilds-page-on-change-of-tab

class HomeBottom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeBottom> {

  final int _pageCount = 2;
  int _pageIndex = 0;

  // Handle tap on navigation item
  void onTabTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // For title
      //appBar: AppBar(
      //  title: Text('Tabs Demo'),
      //),

      // Build the body
      body: _body(),

      // Bottom navigation bar, need to handle onTap to load index.
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return Stack(
        children: List<Widget>.generate(_pageCount, (int index) {
      return IgnorePointer(
        ignoring: index != _pageIndex,
        child: Opacity(
          opacity: _pageIndex == index ? 1.0 : 0.0,
          child: Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return new MaterialPageRoute(
                builder: (_) => _page(index),
                settings: settings,
              );
            },
          ),
        ),
      );
    }),
    );
  }

  Widget _page(int index) {
    switch (index) {
      case 0:
        return FirstTab();
      case 1:
        return SecondTab();
    }

    throw "Invalid index $index";
  }
}
