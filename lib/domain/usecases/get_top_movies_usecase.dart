import 'package:start_now/data/repositories/api_repository_imp.dart';
import 'package:start_now/domain/entities/movie_detail_entity.dart';
import 'package:start_now/domain/repositories/repository.dart';

class GetTopMoviesUseCase {
  final Repository repositoryApi;

  GetTopMoviesUseCase() : repositoryApi = ApiRepositoryImpl();

  Future<List<MovieEntity>?> getTop10Movies() async {
    return await repositoryApi.getTop10Movies();
  }
}