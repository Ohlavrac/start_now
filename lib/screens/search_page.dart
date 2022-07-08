import 'package:flutter/material.dart';
import 'package:start_now/models/search_movie.dart';
import 'package:start_now/repositories/repository_movie_detail.dart';
import 'package:start_now/shared/widgets/bottom_nav_bar.dart';
import 'package:start_now/shared/widgets/card_movie.dart';
import 'package:start_now/shared/widgets/genere_button.dart';

import '../shared/themes/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var movieName;

  @override
  Widget build(BuildContext context) {
    RepositoryMovieDetail repositoryMovie = RepositoryMovieDetail();

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
                    padding: const EdgeInsets.only(left: 20, bottom: 15, right: 20),
                    child: TextField(
                      onChanged: (String value) {
                        setState(() {
                          movieName = value;
                        });
                      },
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
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                  ],
                ),
              ),
              movieName == null ? const Text("...") :
              FutureBuilder(
                future: repositoryMovie.getSearchMovies(movieName),
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
                  return const Center(child: Text("..."),);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
