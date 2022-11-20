import 'package:flutter/material.dart';
import 'package:start_now/domain/entities/movie_detail_entity.dart';
import 'package:start_now/domain/usecases/get_movies_cinema_usecase.dart';
import 'package:start_now/domain/usecases/get_popular_movies_brazil_usecase.dart';
import 'package:start_now/domain/usecases/get_top_movies_usecase.dart';

class MoviesProviders extends ChangeNotifier {
  final GetTopMoviesUseCase getTopMoviesUseCase = GetTopMoviesUseCase();
  final GetPopularMoviesInBrazilUseCase getPopularInBrazil = GetPopularMoviesInBrazilUseCase();
  final GetMoviesCinemaUseCase getMoviesCinema = GetMoviesCinemaUseCase();


  Future<List<MovieEntity>?> getTop10MoviesProvider() async {
    final response = getTopMoviesUseCase.getTop10Movies();
    notifyListeners();
    return response;  
  }

  Future<List<MovieEntity>?> getMoviesPopularInBrazil() async {
    final response = getPopularInBrazil.getPopularMoviesBrazil();
    notifyListeners();
    return response;
  }

  Future<List<MovieEntity>?> getMoviesFromCinema() async {
    final response = getMoviesCinema.getMoviesCinema();
    notifyListeners();
    return response;
  }
}