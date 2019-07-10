import 'package:flutter/material.dart';
import 'package:movies_flutter_app/src/models/movies_model.dart';


class MovieDetail extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(child: Text(movie.title),),
    );
  }
}