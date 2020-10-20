import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final number = Provider.of<int>(context);
    final string = Provider.of<String>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("APPBAR"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Number $number'),
            Text('String $string'),
          ],
        ),
      ),
    );
  }
}
