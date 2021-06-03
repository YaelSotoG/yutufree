import 'package:flutter/material.dart';

import 'package:yutufree/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Free',
      initialRoute: 'inicio',
      routes: {
        'inicio': (BuildContext context) => Homepage(),
      },
    );
  }
}
