
import 'package:flutter/material.dart';

import '../data/vos/movie_vo.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/title_and_horizontal_movie_list_view.dart';
import '../widgets/title_text.dart';

class BestPopularMoviesAndSeriesSection extends StatelessWidget {

  final Function onTapMovie;
  final List<MovieVO> movieList;
  final Function onListEndReached;

  const BestPopularMoviesAndSeriesSection({
    Key? key, required this.onTapMovie, required this.movieList, required this.onListEndReached,
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
          movieList: movieList,
          onListEndReached: onListEndReached,
        ), /// Movie List
      ],
    );
  }
}