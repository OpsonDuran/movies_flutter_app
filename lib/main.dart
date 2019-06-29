import 'package:flutter/material.dart';
import 'package:movies_flutter_app/src/views/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movies App',
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => HomePage(),
      },
      );
  }
}
