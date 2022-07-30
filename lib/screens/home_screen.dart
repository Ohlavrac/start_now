import 'package:flutter/material.dart';
import 'package:start_now/models/movies.dart';
import 'package:start_now/shared/widgets/horizontal_movie_list.dart';
import '../controllers/verify_image.dart';
import '../repositories/repository_movie_detail.dart';
import '../shared/themes/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/themes/app_texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();
  RepositoryMovieDetail repositoryMovieDetail = RepositoryMovieDetail();

  @override
  Widget build(BuildContext context) {
    VerifyImage verifyImage = VerifyImage();

    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                  //  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: FutureBuilder(
                        future: repositoryMovieDetail.getMovieUpcoming(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var movies = snapshot.data as List<Results>;
                            return PageView.builder(
                              controller: _controller,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                Results movie = movies[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/movie_details", arguments: movie.id.toString());
                                  },
                                  child: Card(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Image.network(
                                      verifyImage.verifyImage(movie.backdropPath.toString()),
                                      height: 150,
                                      loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } 
                                        return Container(
                                          color: AppColors.loadimage,
                                          height: 150,
                                          width: 250,
                                          child: const Center(child: Text("Carregando...")),
                                        );
                                      }, 
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return const Center(child: Text("ERROR"),);
                          }
                          return const Center(child: CircularProgressIndicator(),);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: AppColors.loadimage,
                        dotColor: AppColors.colorIcon,
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular no Brasil", style: AppTexts.tag),
                      ],
                    ),
                    const SizedBox(height: 12),
                    HorizontalMovieList(getmovie: repositoryMovieDetail.getPopularMoviesInBrazil(),),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("No Cinema", style: AppTexts.tag),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    HorizontalMovieList(getmovie: repositoryMovieDetail.getMoviesCinema())
                  ]))),
        ));
  }
}
