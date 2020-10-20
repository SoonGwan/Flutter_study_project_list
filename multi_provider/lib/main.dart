import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './_HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<int>.value(value: 50),
          Provider<String>.value(value: 'Hello'),
        ],
        child: MaterialApp(
          home: HomePage(),
        ));
  }
}
