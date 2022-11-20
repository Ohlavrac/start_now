import 'package:start_now/data/dto/movie_dto.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieDto>?> getTop10Movies();
  Future<List<MovieDto>?> getPopularInBrazilMovies();
  Future<List<MovieDto>?> getMoviesCinema();
}