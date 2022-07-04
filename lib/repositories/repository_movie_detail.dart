import 'package:dio/dio.dart';

import '../models/movie_detail.dart';

class RepositoryMovieDetail {
  final String endpoint = "?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-Br 338953";

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
}