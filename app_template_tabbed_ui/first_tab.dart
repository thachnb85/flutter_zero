import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
  @override
  FirstTabState createState() => new FirstTabState();
}

class FirstTabState extends State<FirstTab> {
  String _title = 'First Tab';
  int _counter = 0;
  bool _checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(_title),

//// DEMO USING BUTTON TO NAVIGATE TO OTHER PAGE:
//          leading: new IconButton(
//            icon: new Icon(Icons.looks_two),
//            onPressed: () {
//              Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => SecondTab()));
//            },
//          )
      ),

      body: new Center(
        child: Column(
          children: <Widget>[
            new Text("Check box count = $_counter"),
            new Checkbox(
                value: _checkBoxValue,
                onChanged: (bool newValue) {
                  setState((){
                    _checkBoxValue = newValue;
                    _counter++;
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}
