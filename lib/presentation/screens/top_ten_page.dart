import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_now/domain/entities/movie_detail_entity.dart';
import 'package:start_now/presentation/providers/movies_providers.dart';

import '../repositories/repository_movie_detail.dart';
import '../shared/themes/app_colors.dart';
import '../shared/widgets/ton_ten_card.dart';

class TopTenPage extends StatefulWidget {
  const TopTenPage({Key? key}) : super(key: key);

  @override
  State<TopTenPage> createState() => _TopTenPageState();
}

class _TopTenPageState extends State<TopTenPage> {
  @override
  Widget build(BuildContext context) {
    RepositoryMovieDetail repositoryMovie = RepositoryMovieDetail();
    var movieprovider = context.read<MoviesProviders>().getTop10MoviesProvider();

    return Material(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Top10 Filmes: '),
          ),
          backgroundColor: AppColors.background,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FutureBuilder(
              future: movieprovider,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var movie = snapshot.data as List<MovieEntity>;
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      MovieEntity topMovies = movie[index] as MovieEntity;
                      return TopTenView(
                        position: index + 1,
                        movie: topMovies,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("ERROR");
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
