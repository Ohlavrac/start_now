import 'package:dio/dio.dart';
import 'package:start_now/models/movies.dart';
import 'package:start_now/models/search_movie.dart';

import '../models/movie_detail.dart';

class RepositoryMovieDetail {
  final String baseURL = "https://api.themoviedb.org/3/";
  static String apikey = "816e85e9e115d47a54d5f262723dac3d";
  final String endpoint = "?api_key=$apikey&language=pt-Br";
  final String endpointRecommendations = "movie/recommendations?api_key=$apikey&language=pt-BR&page=1";
  final String endpointSearchMovie = "search/movie?api_key=$apikey&language=pt-BR&query=";
  final String endpointTopMovies = "movie/top_rated?api_key=$apikey&language=pt-BR&page=1&region=BR";
  final String endpointPopularBrazil = "movie/popular?api_key=$apikey&language=pt-BR&page=1&region=BR";
  final String endpointCinema = "movie/now_playing?api_key=$apikey&language=pt-BR&page=2&region=BR";
  final String endpointUpcoming = "movie/upcoming?api_key=$apikey&language=pt-BR&page=1&region=BR";
  final String endpointMovieByGenres = "discover/movie?api_key=$apikey&language=pt-BR&sort_by=revenue.desc&include_adult=false&include_video=false&page=1&with_genres=";
  final String endpointNetflixMovies = "discover/movie?api_key=$apikey&with_watch_providers=8&watch_region=BR";
  final String endpointPrimeVideoMovies = "discover/movie?api_key=$apikey&with_watch_providers=119&watch_region=BR";

  RepositoryMovieDetail();

  Future<MovieDetail?> get(String movieID) async {
    Response response;    
    response = await Dio().get(baseURL+"movie/"+movieID+endpoint);
    if (response.statusCode == 200) {
      return MovieDetail.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<List<Results>?> getRecommendations(String movieID) async {
    Response response;
    response = await Dio().get(baseURL+"movie/"+movieID+endpointRecommendations);
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
      response = await Dio().get(baseURL+endpointSearchMovie+movieName+"&page=1&include_adult=false&region=BR");
      if (response.statusCode == 200) {
        return SearchMovie.fromJson(response.data).results;
      } else {
        return null;
      }
    }
  }

  Future<List<Results>?> getTop10Movies() async {
    Response response;
    response = await Dio().get(baseURL+endpointTopMovies);
    if (response.statusCode == 200) {
      return Movies.fromJson(response.data).results;
    } else {
      return null;
    }
  }

  Future<List<ResultsMovieSearch>?> getMovieByGenres(String genre) async {
    Response response;
    response = await Dio().get(baseURL+endpointMovieByGenres+genre+"&with_watch_monetization_types=flatrate");
    if (response.statusCode == 200) {
      return SearchMovie.fromJson(response.data).results;
    } else {
      return null;
    }
  }

  Future<List<Results>?> getPopularMoviesInBrazil() async {
    Response response;
    response = await Dio().get(baseURL+endpointPopularBrazil);
    if (response.statusCode == 200) {
      return Movies.fromJson(response.data).results;
    } else {
      return null;
    }
  }

  
  Future<List<Results>?> getMoviesCinema() async {
    Response response;
    response = await Dio().get(baseURL+endpointCinema);
    if (response.statusCode == 200) {
      return Movies.fromJson(response.data).results;
    } else {
      return null;
    }
  }

  Future<List<Results>?> getMovieUpcoming() async {
    Response response;
    response = await Dio().get(baseURL+endpointUpcoming);
    if (response.statusCode == 200) {
      return Movies.fromJson(response.data).results;
    } else {
      return null;
    }
  }

  Future<List<Results>?> getNetflixMovies() async {
    Response response;
    response = await Dio().get(baseURL+endpointNetflixMovies);
    if (response.statusCode == 200) {
      return Movies.fromJson(response.data).results;
    } else {
      return null;
    }
  }

  Future<List<Results>?> getPrimeVideoMovies() async {
    Response response;
    response = await Dio().get(baseURL+endpointPrimeVideoMovies);
    if (response.statusCode == 200) {
      return Movies.fromJson(response.data).results;
    } else {
      return null;
    }
  }
}