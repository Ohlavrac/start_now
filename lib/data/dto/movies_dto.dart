import 'package:start_now/data/dto/movie_dto.dart';
import 'package:start_now/domain/entities/movies_entity.dart';

class MoviesDto extends MoviesEntity {
  int? page;
  List<MovieDto>? movie;
  int? totalPages;
  int? totalResults;

  MoviesDto({this.page, this.movie, this.totalPages, this.totalResults});

  MoviesDto.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movie = <MovieDto>[];
      json['results'].forEach((v) {
        movie!.add(new MovieDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.movie != null) {
      data['results'] = this.movie!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}