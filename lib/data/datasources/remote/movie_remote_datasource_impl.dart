import 'package:dio/dio.dart';
import 'package:start_now/data/datasources/movie_remote_datasource.dart';
import 'package:start_now/data/dto/movie_dto.dart';
import 'package:start_now/data/dto/movies_dto.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  @override
  Future<List<MovieDto>?> getPopularInBrazilMovies() async {
    Response response;
    response = await Dio().get("https://api.themoviedb.org/3/movie/popular?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-BR&page=1&region=BR");
    if (response.statusCode == 200) {
      return MoviesDto.fromJson(response.data).movie;
    } else {
      return null;
    }
  }

  @override
  Future<List<MovieDto>?> getTop10Movies() async {
    Response response;
    response = await Dio().get("https://api.themoviedb.org/3/movie/top_rated?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-BR&page=1&region=BR");
    if (response.statusCode == 200) {
      return MoviesDto.fromJson(response.data).movie;
    } else {
      return null;
    }
  }
  
  @override
  Future<List<MovieDto>?> getMoviesCinema() async {
    Response response;
    response = await Dio().get("https://api.themoviedb.org/3/movie/now_playing?api_key=816e85e9e115d47a54d5f262723dac3d&language=pt-BR&page=2&region=BR");
    if (response.statusCode == 200) {
      return MoviesDto.fromJson(response.data).movie;
    } else {
      return null;
    }
  }
}