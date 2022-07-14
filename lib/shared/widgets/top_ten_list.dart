import 'package:flutter/material.dart';

final ListMovie = [
  'Thor: Love and Thunder',
  'Thor: Love and Thunder',
  'Thor: Love and Thunder',
  'Thor: Love and Thunder',
  'Thor: Love and Thunder',
  'Thor: Love and Thunder',
  'Thor: Love and Thunder',
  'Thor: Love and Thunder',
  'Thor: Love and Thunder',
  'Thor: Love and Thunder',
];

class TopTenView extends StatelessWidget {
  const TopTenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ListMovie.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onDoubleTap: () {},
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
                    child: Image.asset(
                      'assets/images/thor_movie.jpg',
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
                            Text(
                              ListMovie[index],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              '07/07/2022',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'sinopsis',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: CircleAvatar(
                            child: Text(
                              '${index + 1}',
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
      },
    );
  }
}
