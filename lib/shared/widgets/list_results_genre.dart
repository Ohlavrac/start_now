import 'package:flutter/material.dart';
import '../../models/search_movie.dart';
import '../../repositories/repository_movie_detail.dart';
import 'card_movie.dart';

class ListResultGenre extends StatelessWidget {
  final RepositoryMovieDetail repositoryMovie;
  final String genre;

  const ListResultGenre(
      {Key? key, required this.repositoryMovie, required this.genre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repositoryMovie.getMovieByGenres(genre),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movie = snapshot.data as List<ResultsMovieSearch>;
            return Expanded(
              child: ListView.builder(
                itemCount: movie.length,
                itemBuilder: (context, index) {
                  ResultsMovieSearch resultsMovieSearch = movie[index];
                  return CardMovie(
                    resultsMovieSearch: resultsMovieSearch,
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("ERROR"),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
