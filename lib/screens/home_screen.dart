import 'package:flutter/material.dart';
import 'package:start_now/models/movies.dart';
import 'package:start_now/shared/widgets/horizontal_movie_list.dart';
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
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                  //  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
                      height: 200,
                      child: PageView(controller: _controller, children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/thor_movie.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/thor_movie.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/thor_movie.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/thor_movie.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ]),
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
                        Text("Popular no Brasil", style: AppTexts.tag),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    HorizontalMovieList(getmovie: repositoryMovieDetail.getMoviesCinema())
                  ]))),
        ));
  }
}
