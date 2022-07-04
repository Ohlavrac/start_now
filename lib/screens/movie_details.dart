import 'package:flutter/material.dart';
import 'package:start_now/models/movie_detail.dart';
import 'package:start_now/repositories/repository_movie_detail.dart';
import 'package:start_now/shared/themes/app_colors.dart';
import 'package:start_now/shared/themes/app_texts.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepositoryMovieDetail repositoryMovieDetail = RepositoryMovieDetail();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
            future: repositoryMovieDetail.get("500"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var movie = snapshot.data as MovieDetail;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network("https://image.tmdb.org/t/p/original/${movie.posterPath}", height: 230,),
                        Column(
                          children: [
                            SizedBox(width: 200, child: Text("${movie.title} (${movie.releaseDate?.substring(0,4)})", style: AppTexts.title,)),
                          ],
                        )
                      ],
                    ),
                    Text("${movie.tagline}", style: AppTexts.tagname,),
                    Text("Sinopse:", style: AppTexts.overview,),
                    Text("${movie.overview}", textAlign: TextAlign.justify, style: AppTexts.overview,),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text("ERROR");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}