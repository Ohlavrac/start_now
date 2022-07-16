import 'package:flutter/material.dart';
import 'package:start_now/models/movies.dart';

import '../themes/app_colors.dart';

class TopTenView extends StatelessWidget {
  final Results movie;
  final int position;

  const TopTenView({Key? key, required this.movie, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/movie_details", arguments: movie.id.toString());
          },
          child: Card(
            color: const Color.fromRGBO(85, 85, 85, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                      loadingBuilder: (context, child, loadingProgress) {
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
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                "${movie.title}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '${movie.releaseDate}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                "${movie.overview}",
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
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: CircleAvatar(
                            child: Text(
                              '$position',
                            ),
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
