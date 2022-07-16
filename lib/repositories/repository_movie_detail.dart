import 'package:dio/dio.dart';
import 'package:start_now/models/movies.dart';
import 'package:start_now/models/search_movie.dart';

import '../models/movie_detail.dart';

class RepositoryMovieDetail {
  final String endpoint = "?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-Br";
  final String endpointRecommendations = "/recommendations?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-BR&page=1";
  final String endpointSearchMovie = "/search/movie?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-BR&query=";
  final String endpointTopMovies = "/top_rated?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-BR&page=1&region=BR";

  RepositoryMovieDetail();

  Future<MovieDetail?> get(String movieID) async {
    Response response;    
    response = await Dio().get("https://api.themoviedb.org/3/movie/"+movieID+endpoint);
    if (response.statusCode == 200) {
      return MovieDetail.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<List<Results>?> getRecommendations(String movieID) async {
    Response response;
    response = await Dio().get("https://api.themoviedb.org/3/movie/"+movieID+endpointRecommendations);
    print(response);
    if (response.statusCode == 200) {
      
      return Movies.fromJson(response.data).results;
    } else {
      return null;
    }
  }

  Future<List<ResultsMovieSearch>?> getSearchMovies(String movieName) async {
    Response response;
    if (movieName!="") {
      response = await Dio().get("https://api.themoviedb.org/3"+endpointSearchMovie+movieName+"&page=1&include_adult=false&region=BR");
      if (response.statusCode == 200) {
        return SearchMovie.fromJson(response.data).results;
      } else {
        return null;
      }
    }
  }

  Future<List<Results>?> getTop10Movies() async {
    Response response;
    response = await Dio().get("https://api.themoviedb.org/3/movie"+endpointTopMovies);
    if (response.statusCode == 200) {
      return Movies.fromJson(response.data).results;
    } else {
      return null;
    }
  }
}