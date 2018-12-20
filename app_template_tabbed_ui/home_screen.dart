import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<dynamic> pages = [
    new Page1(),
    new Page2(),
    new Page3(),
    new Page4(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        await Future<bool>.value(true);
      },
      child: new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
          //iconSize: 35.0,
          onTap: (index) {
            setState(() => currentIndex = index);
          },
          // activeColor: currentIndex == 0 ? Colors.white : Colors.black,
          // inactiveColor: currentIndex == 0 ? Colors.green : Colors.grey,
          // backgroundColor: currentIndex == 0 ? Colors.black : Colors.white,
          currentIndex: currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              title: Text('Page'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('Info'),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return new DefaultTextStyle(
            style: const TextStyle(
              fontFamily: '.SF UI Text',
              fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child: new CupertinoTabView(
              routes: <String, WidgetBuilder>{
                '/Page1': (BuildContext context) => new Page1(),
                '/Page2': (BuildContext context) => new Page2(),
                '/Page3': (BuildContext context) => new Page3(),
                '/Page4': (BuildContext context) => new Page4(),
              },
              builder: (BuildContext context) {
                return pages[currentIndex];
              },
            ),
          );
        },
      ),
    );
  }
}
