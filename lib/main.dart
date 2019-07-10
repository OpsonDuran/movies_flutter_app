import 'package:flutter/material.dart';
import 'package:movies_flutter_app/src/views/home_page.dart';
import 'package:movies_flutter_app/src/views/movie_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movies App',
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => HomePage(),
        'detail':(BuildContext context) => MovieDetail(),
      },
      );
  }
}
