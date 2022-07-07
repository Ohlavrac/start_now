import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:start_now/models/movie_detail.dart';
import 'package:start_now/models/movies.dart';
import 'package:start_now/repositories/repository_movie_detail.dart';
import 'package:start_now/shared/themes/app_colors.dart';
import 'package:start_now/shared/themes/app_texts.dart';
import 'package:start_now/shared/widgets/recommended_movies_card.dart';

class MovieDetails extends StatelessWidget {
  //final String movieID = "297761";
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepositoryMovieDetail repositoryMovieDetail = RepositoryMovieDetail();
    var movieID = ModalRoute.of(context)!.settings.arguments as String?;
    movieID == null ? movieID = "297761" : movieID = ModalRoute.of(context)!.settings.arguments as String;


    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
            future: repositoryMovieDetail.get(movieID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var movie = snapshot.data as MovieDetail;

                String movieRunTime(int minutes) {
                    var d = Duration(minutes:minutes);
                    List<String> parts = d.toString().split(':');
                    return '${parts[0].padLeft(2, '0')}h:${parts[1].padLeft(2, '0')}m';
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network("https://image.tmdb.org/t/p/original/${movie.posterPath}", height: 230,),
                        SizedBox(
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${movie.title} (${movie.releaseDate?.substring(0,4)})", style: AppTexts.title,),
                                Text("${movie.releaseDate} (${movie.productionCountries![0].iso31661}) | ${movieRunTime(movie.runtime!)}", style: AppTexts.overview,),
                                SizedBox(
                                  height: 30,
                                  width: 200,
                                  child: ListView.builder(
                                    itemCount: movie.genres!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Text("${movie.genres![index].name}  ", style: AppTexts.overview,);
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 25,
                                      lineWidth: 4.0,
                                      percent: movie.voteAverage! / 10,
                                      center: Text("${movie.voteAverage!.toInt() * 10}%", style: AppTexts.title,),
                                      progressColor: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: SizedBox(width: 130, child: Text("Avaliação dos usuários", style: AppTexts.title,)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,),
                      child: Text("${movie.tagline}", style: AppTexts.tagname,),
                    ),
                    Text("Sinopse:", style: AppTexts.title,),
                    Text("${movie.overview}", textAlign: TextAlign.justify, style: AppTexts.overview,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 5),
                      child: Text("Recomendações", style: AppTexts.title),
                    ),
                    FutureBuilder(
                      future: repositoryMovieDetail.getRecommendations(movieID!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var movies = snapshot.data as List<Results>;
                          return Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                Results resultsMovies = movies[index];
                                return RecommendedMoviesCard(resultsMovies: resultsMovies);
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Text("ERROR");
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text("ERROR");
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}