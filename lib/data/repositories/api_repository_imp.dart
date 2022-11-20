import 'package:start_now/domain/entities/movie_detail_entity.dart';
import 'package:start_now/domain/repositories/repository.dart';

import '../datasources/remote/movie_remote_datasource_impl.dart';

class ApiRepositoryImpl extends Repository {
  //final MovieRemoteDataSource movieRemoteDataSource;

  ApiRepositoryImpl() : super(remote: MovieRemoteDataSourceImpl());
  
  @override
  Future<List<MovieEntity>?> getPopularMoviesInBrazil() {
    return remote.getPopularInBrazilMovies();
  }
  
  @override
  Future<List<MovieEntity>?> getTop10Movies() {
    return remote.getTop10Movies();
  }
  
  @override
  Future<List<MovieEntity>?> getMoviesCinema() {
    return remote.getMoviesCinema();
  }
}