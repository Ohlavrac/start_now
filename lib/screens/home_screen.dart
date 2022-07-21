import 'package:flutter/material.dart';
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
  List dataMovie = [
    {
      "image":
          "https://i.pinimg.com/736x/a9/19/f6/a919f6a1cf6459f78e626471df6dbceb.jpg",
      "title": "The batman",
      "genre": "Action",
      "age": "13+",
      "rating": "10.0",
    },
    {
      "image":
          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/08/03/1363211994.jpg",
      "title": "Money Heist",
      "genre": "Crime",
      "age": "18+",
      "rating": "8.2",
    },
    {
      "image":
          "https://i.pinimg.com/736x/a9/19/f6/a919f6a1cf6459f78e626471df6dbceb.jpg",
      "title": "Interstellar",
      "genre": "Adventura",
      "age": "R",
      "rating": "8.6",
    },
    {
      "image":
          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/08/03/1363211994.jpg",
      "title": "Avengers: Infinity War",
      "genre": "Sci:Fi",
      "age": "13+",
      "rating": "8.4",
    },
    {
      "image":
          "https://i.pinimg.com/736x/a9/19/f6/a919f6a1cf6459f78e626471df6dbceb.jpg",
      "title": "Peaky Blinders",
      "genre": "Crime",
      "age": "18+",
      "rating": "8.8",
    },
  ];
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
            child: Padding(
                //  physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
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
                  SizedBox(
                    width: double.infinity,
                    height: 170,
                    child: Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                          ),
                          itemCount: dataMovie.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 160,
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.network(
                                        "${dataMovie[index]['image']}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ]),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nos Cinemas", style: AppTexts.tag),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 170,
                    child: Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                          ),
                          itemCount: dataMovie.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 160,
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.network(
                                        "${dataMovie[index]['image']}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ]),
                            );
                          }),
                    ),
                  ),
                ]))));
  }
}
