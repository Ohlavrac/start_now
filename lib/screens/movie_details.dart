import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:start_now/controllers/verify_image.dart';
import 'package:start_now/models/movie_detail.dart';
import 'package:start_now/models/movies.dart';
import 'package:start_now/repositories/repository_movie_detail.dart';
import 'package:start_now/screens/home_screen.dart';
import 'package:start_now/screens/search_page.dart';
import 'package:start_now/screens/top_ten_page.dart';
import 'package:start_now/shared/themes/app_colors.dart';
import 'package:start_now/shared/themes/app_texts.dart';
import 'package:start_now/shared/widgets/bottom_nav_bar.dart';
import 'package:start_now/shared/widgets/recommended_movies_card.dart';

class MovieDetails extends StatefulWidget {
  //final String movieID = "297761";
  const MovieDetails({Key? key}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  int _selectedIndex = 0;
  int temp = 3;

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
      temp = 0;
    });
  }

  List<Widget> screens = [
    const HomeScreen(),
    const SearchPage(),
    const TopTenPage()
  ];

  @override
  Widget build(BuildContext context) {
    VerifyImage verifyImage = VerifyImage();
    RepositoryMovieDetail repositoryMovieDetail = RepositoryMovieDetail();
    var movieID = ModalRoute.of(context)!.settings.arguments as String?;
    movieID == null ? movieID = "297761" : movieID = ModalRoute.of(context)!.settings.arguments as String;
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: temp == 3 ? SingleChildScrollView(
        child:SafeArea(
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
                          Image.network(verifyImage.verifyImage(movie.posterPath.toString()), height: 230, width: 150,),
                          SizedBox(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${movie.title} (${movie.releaseDate?.length == 0 ? "" : movie.releaseDate?.substring(0,4)})", style: AppTexts.title,),
                                  Text("${movie.releaseDate} (${movie.productionCountries!.isNotEmpty ? movie.productionCountries![0].iso31661 : ""}) | ${movieRunTime(movie.runtime!)}", style: AppTexts.overview,),
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
                      movie.overview == "" ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60),
                        child: Center(child: Text("Esse filme não tem Sinopse '-'", style: AppTexts.title,)),
                      ) :
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
                            if (movies.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 60),
                                child: Center(child: Text("Não a recomendações para esse filme", style: AppTexts.title,)),
                              );
                            }
                            return SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    Results resultsMovies = movies[index];
                                    return RecommendedMoviesCard(resultsMovies: resultsMovies);
                                  },
                                ),
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
        )
      ) : screens[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(onItemTapped: _onItemTapped, selectedIndex: _selectedIndex,),
    );
  }
}