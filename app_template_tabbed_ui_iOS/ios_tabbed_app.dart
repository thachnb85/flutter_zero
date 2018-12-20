import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeiOSTabbedApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeiOSTabbedApp> {

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
    return new Scaffold(
//      // AppBar following iOS style
//      appBar: new CupertinoNavigationBar(
//        middle: const Text('Home'),
//      ),

      body: _body(),

      // Bottom navigation bar, need to handle onTap to load index.
      bottomNavigationBar: CupertinoTabBar(
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

  //// PUSHING NEW VIEW USING THIS CODE WILL BE SHOWN UNDER TAB BAR
  Widget _body() {
    return Stack(
        children: List<Widget>.generate(_pageCount, (int index) {
      return IgnorePointer(
        ignoring: index != _pageIndex,
        child: Opacity(
          opacity: _pageIndex == index ? 1.0 : 0.0,
          child: Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return new CupertinoPageRoute(
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

  //// PUSHING NEW VIEW USING THIS CODE WILL BE SHOWN OVER TAB BAR
//    Widget _body() {
//      return Stack(
//        children: <Widget>[
//          new Offstage(
//            offstage: _pageIndex != 0,
//            child: FirstTab()
//          ),
//          new Offstage(
//              offstage: _pageIndex != 1,
//              child: SecondTab()
//          ),
//        ]
//      );
//    }

  Widget _page(int index) {
    switch (index) {
      case 0:
        return iOSFirstTab();
      case 1:
        return iOSSecondTab();
    }

    throw "Invalid index $index";
  }
}

// ======================== iOSFirstTab ==========================
// Showing First Tab in iOS Style
class iOSFirstTab extends StatefulWidget {
  @override
  FirstTabState createState() => new FirstTabState();
}

class FirstTabState extends State<iOSFirstTab> {
  String _title = 'First Tab';
  int _selectedSegmentIndex = 0;

  final Map<int, Widget> itemLists = const <int, Widget>{
    0: Text('Map '),
    1: Text('Satellite '),
    2: Text('Hybrid '),
  };

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
            middle: new Text(_title),
            leading: new IconButton(
              icon: new Icon(Icons.contacts),
              onPressed: () {
                Navigator.of(context)
                    .push(
                    CupertinoPageRoute(builder: (context) => LoginPage()));
              },
            )
        ),

        child: SafeArea(
          child: Column(
            children: <Widget>[
              new Text('You selected segment $_selectedSegmentIndex'),
              new CupertinoSegmentedControl(
                  children: itemLists,
                  groupValue: _selectedSegmentIndex, // this is actually selected item.
                  onValueChanged: (int newValue) {
                    setState(() {
                      _selectedSegmentIndex = newValue;
                    });
                  }
              )
            ],
          ),
        )
    );
  }
}


// ======================== iOSSecondTab ==========================
class iOSSecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => new _SecondTabState();
}

class _SecondTabState extends State<iOSSecondTab> {
  String _title;

  // For slider:
  double _value = 25.0;

  @override
  void initState() {
    _title = 'Second Tab';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CupertinoNavigationBar(
        middle: new Text(_title),
      ),

      body: new Center(
        child: Column(
          // One slider
          children: <Widget>[
            new CupertinoSlider(
                value: _value,
                min: 0.0,
                max: 100.0,
                onChanged: (double value) {
                  setState(() {
                    _value = value;
                  });
                }
            ),

            // One button which can push another view
            new CupertinoButton(
              child: new Text('Adding Item', style: new TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) => AddingItemPage()));
              },
            )

          ],
        ),
      ),
    );
  }
}

// ======================== AddingItemPage ==========================
// notice: without CupertinoNavigationBar, no way to go back!

class AddingItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CupertinoNavigationBar(
        middle: const Text('Add Me')
      ),
      body: new Center(
          child: new CupertinoButton(
            child: new Text('Add Me'),
            color: Colors.redAccent,
            onPressed: () {},
          )),
    );
  }
}

// ======================== LoginPage ==========================
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _title;

  // For slider:
  double _value = 25.0;

  @override
  void initState() {
    _title = 'Second Tab';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CupertinoNavigationBar(
        middle: new Text('Login Page'),
      ),

      body: new Center(
        child: Column(
          // One slider
          children: <Widget>[
            new CupertinoSlider(
                value: _value,
                min: 0.0,
                max: 100.0,
                onChanged: (double value) {
                  setState(() {
                    _value = value;
                  });
                }
            ),

            // One button which can push another view
            new CupertinoButton(
              child: new Text('Login Now', style: new TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) => AddingItemPage()));
              },
            )

          ],
        ),
      ),
    );
  }
}
