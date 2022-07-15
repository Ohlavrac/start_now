import 'package:flutter/material.dart';

import '../../models/search_movie.dart';
import '../themes/app_colors.dart';

class CardMovie extends StatelessWidget {
  final ResultsMovieSearch resultsMovieSearch;

  const CardMovie(
      {Key? key, required this.resultsMovieSearch,})
      : super(key: key);

  String verifyImage(String imageName) {
    if (imageName == "null") {
      return "https://media.istockphoto.com/vectors/error-404-vector-id538038858";
    } else {
      return "https://image.tmdb.org/t/p/original/${imageName}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/movie_details", arguments: resultsMovieSearch.id.toString());
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: const Color.fromRGBO(85, 85, 85, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                 verifyImage(resultsMovieSearch.posterPath.toString()),
                 height: 150,
                 width: 100,
                 loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } 
                  return Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.loadimage,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(child: Text("Carregando...")),
                  );
                }, 
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        "${resultsMovieSearch.title}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "${resultsMovieSearch.releaseDate}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 210,
                      child: Text(
                        "${resultsMovieSearch.overview}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
