import 'package:start_now/domain/entities/movie_detail_entity.dart';

class MoviesEntity {
  int? page;
  List<MovieEntity>? results;
  int? totalPages;
  int? totalResults;

  MoviesEntity({this.page, this.results, this.totalPages, this.totalResults});
}