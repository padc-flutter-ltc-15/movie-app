
import 'package:flutter/material.dart';
import 'package:themovieapp/widgets/rating_view.dart';

import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/title_text.dart';

class BestPopularMoviesAndSeriesSection extends StatelessWidget {

  final Function onTapMovie;

  const BestPopularMoviesAndSeriesSection({
    Key? key, required this.onTapMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: MARGIN_MEDIUM_2X,
          ),
          child: TitleText(
            title: MAIN_SCREEN_BEST_POPULAR_MOVIES_AND_SERIES,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2X,
        ),
        HorizontalMovieListView(
          onTapMovie: onTapMovie,
        ), /// Movie List
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {

  final Function onTapMovie;

  const HorizontalMovieListView({
    Key? key, required this.onTapMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGH,
      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2X),
      child: ListView.builder( /// ListView
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return MovieItemView(
            onTapMovie: onTapMovie,
          );
        },
      ),
    );
  }
}

class MovieItemView extends StatelessWidget {

  final Function onTapMovie;

  const MovieItemView({
    Key? key, required this.onTapMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              onTapMovie();
            },
            child: Image.network(
              "https://www.giantfreakinrobot.com/wp-content/uploads/2021/07/hugh-jackman-wolverine.jpg",
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          const Text(
            "Logan",
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Row(
            children: [
              const Text(
                "8.0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: MARGIN_SMALL,
              ),
              RatingView()
            ],
          ),
        ],
      ),
    );
  }
}