import 'package:flutter/material.dart';
import 'package:start_now/controllers/verify_image.dart';
import '../../models/movies.dart';
import '../themes/app_texts.dart';
import 'loading_image.dart';

class HorizontalMovieList extends StatelessWidget {
  final Future<List<Results>?> getmovie;

  HorizontalMovieList({Key? key, required this.getmovie}) : super(key: key);

  VerifyImage verifyImage = VerifyImage();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getmovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var movies = snapshot.data as List<Results>;
          if (movies.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Center(
                  child: Text(
                "Não a recomendações para esse filme",
                style: AppTexts.title,
              )),
            );
          }
          return SizedBox(
            height: 180,
            width: double.infinity,
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  Results resultsMovies = movies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/movie_details",
                          arguments: resultsMovies.id.toString());
                    },
                    child: Card(
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.network(
                        verifyImage
                            .verifyImage(resultsMovies.posterPath.toString()),
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const LoadingImage(
                            height: 160,
                            width: 120,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text("ERROR");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
