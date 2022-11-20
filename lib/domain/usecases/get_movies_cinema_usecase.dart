import 'package:start_now/data/repositories/api_repository_imp.dart';
import 'package:start_now/domain/entities/movie_detail_entity.dart';
import 'package:start_now/domain/repositories/repository.dart';

class GetMoviesCinemaUseCase {
  final Repository repositoryApi;

  GetMoviesCinemaUseCase() : repositoryApi = ApiRepositoryImpl();

  Future<List<MovieEntity>?> getMoviesCinema() async {
    
  }
}