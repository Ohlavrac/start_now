import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_now/models/movies.dart';
import 'package:start_now/presentation/providers/movies_providers.dart';
import '../../controllers/verify_image.dart';
import '../repositories/repository_movie_detail.dart';
import '../shared/themes/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/themes/app_texts.dart';
import '../shared/widgets/horizontal_movie_list.dart';
import '../shared/widgets/loading_image.dart';

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
    var movieRepository = context.read<MoviesProviders>();

    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                  //  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      margin: const EdgeInsets.all(12.0),
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
                                    Navigator.pushNamed(
                                        context, "/movie_details",
                                        arguments: movie.id.toString());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.network(
                                      verifyImage.verifyImage(
                                          movie.backdropPath.toString()),
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const LoadingImage(width: 150, height: 200,);
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: Text("ERROR"),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SmoothPageIndicator(
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
                    ),
                    const SizedBox(height: 20),
                    Text("Popular no Brasil", style: AppTexts.tag),
                    const SizedBox(height: 12),
                    HorizontalMovieList(
                      getmovie:
                          movieRepository.getMoviesPopularInBrazil(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(height: 20),
                    Text("No Cinema", style: AppTexts.tag),
                    const SizedBox(
                      height: 12,
                    ),
                    HorizontalMovieList(
                        getmovie: movieRepository.getMoviesFromCinema())
                  ]))),
        ));
  }
}
