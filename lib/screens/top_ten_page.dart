import 'package:flutter/material.dart';
import 'package:start_now/models/movies.dart';
import 'package:start_now/repositories/repository_movie_detail.dart';

import '../shared/themes/app_colors.dart';
import '../shared/widgets/top_ten_list.dart';

class TopTenPage extends StatefulWidget {
  const TopTenPage({Key? key}) : super(key: key);

  @override
  State<TopTenPage> createState() => _TopTenPageState();
}

class _TopTenPageState extends State<TopTenPage> {
  @override
  Widget build(BuildContext context) {
    RepositoryMovieDetail repositoryMovie = RepositoryMovieDetail();

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
              future: repositoryMovie.getTop10Movies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var movie = snapshot.data as List<Results>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        Results topMovies = movie[index];
                        return TopTenView(
                          position: index + 1,
                          movie: topMovies,
                        );
                      },
                    ),
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
