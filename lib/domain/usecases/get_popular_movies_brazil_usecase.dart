import 'package:start_now/data/repositories/api_repository_imp.dart';
import 'package:start_now/domain/entities/movie_detail_entity.dart';
import 'package:start_now/domain/repositories/repository.dart';

class GetPopularMoviesInBrazilUseCase {
  final Repository repositoryApi;

  GetPopularMoviesInBrazilUseCase() : repositoryApi = ApiRepositoryImpl();

  Future<List<MovieEntity>?> getPopularMoviesBrazil() async {
    return await repositoryApi.getPopularMoviesInBrazil();
  }
}