import 'package:dio/dio.dart';
import 'package:start_now/models/movies.dart';

import '../models/movie_detail.dart';

class RepositoryMovieDetail {
  final String endpoint = "?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-Br";
  final String endpointRecommendations = "/recommendations?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-BR&page=1";

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
}