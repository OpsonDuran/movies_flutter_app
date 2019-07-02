import 'dart:convert';

import 'package:movies_flutter_app/src/models/movies_model.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apikey = 'e05012a4f6646a86ab26f517863bad65';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Movie>> _processResponse(Uri url) async{
    final response = await http.get(url);
    final decodeData = json.decode(response.body);
    final movies = new Movies.fromJsonList(decodeData['results']);
    return movies.items;
  }

  Future<List<Movie>> getInTheaters()async{
    final url = Uri.https(_url, '/3/movie/now_playing',{
      'api_key': _apikey,
      'languege': _language, 
    });

    return await _processResponse(url);
  }


  Future<List<Movie>> getPopular() async{
    final url = Uri.https(_url, '/3/movie/popular',{
      'api_key': _apikey,
      'languege': _language, 
    });

    return await _processResponse(url);
  }

}