import 'package:flutter/material.dart';
import 'package:movies_flutter_app/src/providers/movies_provider.dart';
import 'package:movies_flutter_app/src/widgets/card_swiper_widget.dart';
import 'package:movies_flutter_app/src/widgets/movie_horizontal.dart';


class HomePage extends StatelessWidget {
  final moviesProvider = new MoviesProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
        ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTargets(),
            _footer(context),
          ],
        ),
      )

    );
  }


  Widget _swiperTargets(){
    return FutureBuilder(
      future: 
    moviesProvider.getInTheaters(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData){
    return CardSwiper(
      movies: snapshot.data,
    );
    }else{
      return Container(
        height: 400,
        child: Center(child: CircularProgressIndicator()));
    }
    },
    );

  }

  Widget _footer(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares',style: Theme.of(context).textTheme.subhead,)),
          SizedBox(height: 5.0,),
          FutureBuilder(
            future: MoviesProvider().getPopular(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return MovieHorizontal(
                        movies: snapshot.data,
                  );
              }else{
      return Container(
        height: 200,
        child: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ],),
    );
  }

}