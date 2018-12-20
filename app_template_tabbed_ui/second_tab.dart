import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SecondTab extends StatefulWidget {
  @override
  SecondTabState createState() => new SecondTabState();
}

class SecondTabState extends State<SecondTab> with AutomaticKeepAliveClientMixin<SecondTab> {
  String _title;

  // For slider:
  double _value = 25.0;

  // must implemented for AutomaticKeepAliveClientMixin
  // We don't need if parent widget put everything in Stack.
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _title = 'Second Tab';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(_title),
      ),
      body: new Center(
        child: Column(

          // One slider
          children: <Widget>[
            CupertinoSlider(
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
            new FlatButton(
              child: new Text('Adding Item', style: new TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddingItemPage()));
              },
            )

          ],
        ),
      ),
    );
  }
}

class AddingItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add New Item'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: ()
            {
              // Push itself, why not?
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddingItemPage()));
            }
          )
        ],
      ),
      body: new Center(
          child: new RaisedButton(
            child: new Text('Add Me', style: new TextStyle(color: Colors.white)),
            color: Colors.redAccent,
            onPressed: () {},
          )),
    );
  }
}
