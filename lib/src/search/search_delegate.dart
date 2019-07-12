import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  String select='';

  final movies = [
    'la toalla del mojado',
    'pokemon',
    'aladino',
    'spiderman',
  ];

  final moviesNew =[
    'la toalla mojada',
    'la toalla mojada6',
    ];


  @override
  List<Widget> buildActions(BuildContext context) {
    // actions of AppBar

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icon left appbar
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder for create results of view
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(select) ,),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // suggestions for write text

    final listSearchSuggestions = (query.isEmpty) 
                                      ? moviesNew  
                                      : movies.where(
                                        (movie) => movie.toLowerCase().startsWith(query.toLowerCase())
                                      ).toList();

    return ListView.builder(
      itemCount: listSearchSuggestions.length,
      itemBuilder: (context,i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listSearchSuggestions[i]),
          onTap: (){
            select = listSearchSuggestions[i];
            showResults(context);
          },
        );
      },
    );
  }
}
