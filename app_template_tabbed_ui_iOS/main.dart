import 'package:flutter/material.dart';
import 'ios_tabbed_app.dart';

void main() {
  runApp(App());
}

// We have to use MaterialApp, why??
// Lot of build errors regarding
// ... widgets require MaterialLocalizations etc.
// This looks weird, but it works,
// Flutter is not that good.

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: HomeiOSTabbedApp(),
    );
  }
}
