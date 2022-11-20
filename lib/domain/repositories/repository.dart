import 'package:start_now/data/datasources/movie_remote_datasource.dart';
import 'package:start_now/domain/entities/movie_detail_entity.dart';

abstract class Repository {
  late MovieRemoteDataSource remote;

  Repository({required this.remote});

  Future<List<MovieEntity>?> getTop10Movies();
  Future<List<MovieEntity>?> getPopularMoviesInBrazil();
  Future<List<MovieEntity>?> getMoviesCinema();
}