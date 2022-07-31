import 'package:flutter/material.dart';
import 'package:start_now/models/search_movie.dart';
import 'package:start_now/repositories/repository_movie_detail.dart';
import 'package:start_now/shared/widgets/card_movie.dart';
import 'package:start_now/shared/widgets/genere_button.dart';
import 'package:start_now/shared/widgets/list_results_genre.dart';

import '../shared/themes/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var movieName;

  void search(String value) {
    setState(() {
      movieName = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: const Color.fromARGB(192, 255, 255, 255),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 15, right: 20),
                    child: TextField(
                      onChanged: (String value) => search(value),
                      onSubmitted: (String value) => search(value),
                      decoration: const InputDecoration(
                        suffixIconColor: Colors.white,
                        labelText: 'Search',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenereButton(genere: 'Ação', onTap: () => search("Ação")),
                    GenereButton(
                        genere: 'Terror', onTap: () => search("Terror")),
                    GenereButton(
                        genere: 'Comédia', onTap: () => search("Comédia")),
                    GenereButton(genere: 'Drama', onTap: () => search("Drama")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenereButton(
                        genere: 'Animação', onTap: () => search("Animação")),
                    GenereButton(
                        genere: 'Família', onTap: () => search("Família")),
                    GenereButton(
                        genere: 'Fantasia', onTap: () => search("Fantasia")),
                    GenereButton(
                        genere: 'História', onTap: () => search("História")),
                  ],
                ),
              ),
              movieName == null
                  ? const Text("...")
                  : ResultsList(genere: movieName),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultsList extends StatefulWidget {
  final String genere;

  const ResultsList({Key? key, required this.genere}) : super(key: key);

  @override
  State<ResultsList> createState() => _ResultsListState();
}

class _ResultsListState extends State<ResultsList> {
  @override
  Widget build(BuildContext context) {
    RepositoryMovieDetail repositoryMovie = RepositoryMovieDetail();

    print(widget.genere);
    switch (widget.genere) {
      case "Ação":
        return ListResultGenre(repositoryMovie: repositoryMovie, genre: "28");

      case "Comédia":
        return ListResultGenre(repositoryMovie: repositoryMovie, genre: "35");

      case "Drama":
        return ListResultGenre(repositoryMovie: repositoryMovie, genre: "18");

      case "Terror":
        return ListResultGenre(repositoryMovie: repositoryMovie, genre: "27");

      case "Família":
        return ListResultGenre(
            repositoryMovie: repositoryMovie, genre: "10751");

      case "Animação":
        return ListResultGenre(repositoryMovie: repositoryMovie, genre: "16");

      case "Fantasia":
        return ListResultGenre(repositoryMovie: repositoryMovie, genre: "14");

      case "Historia":
        return ListResultGenre(repositoryMovie: repositoryMovie, genre: "36");

      default:
        return FutureBuilder(
          future: repositoryMovie.getSearchMovies(widget.genere),
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
              return const Text("ERROR");
            }
            return const Center(
              child: Text("..."),
            );
          },
        );
    }
  }
}
