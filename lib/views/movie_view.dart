
import 'package:flutter/material.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/widgets/rating_view.dart';

import '../data/vos/movie_vo.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/title_text.dart';

class BestPopularMoviesAndSeriesSection extends StatelessWidget {

  final Function onTapMovie;
  final List<MovieVO> movieList;

  const BestPopularMoviesAndSeriesSection({
    Key? key, required this.onTapMovie, required this.movieList,
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
        ), /// Movie List
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {

  final Function onTapMovie;
  final List<MovieVO> movieList;

  const HorizontalMovieListView({
    Key? key, required this.onTapMovie, required this.movieList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGH,
      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2X),
      child: ListView.builder( /// ListView
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieItemView(
            onTapMovie: onTapMovie,
            movie: movieList[index],
          );
        },
      ),
    );
  }
}

class MovieItemView extends StatelessWidget {

  final Function onTapMovie;
  final MovieVO movie;

  const MovieItemView({
    Key? key, required this.onTapMovie, required this.movie,
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
              onTapMovie(movie.id);
            },
            child: Image.network(
              IMAGE_BASE_URL + movie.posterPath,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            (movie.title.length >= 7)? movie.title.replaceRange(7, movie.title.length, '...') : movie.title,
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
              Text(
                movie.voteAverage.toString(),
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