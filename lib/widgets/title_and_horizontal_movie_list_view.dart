
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themovieapp/components/smart_list_view.dart';
import 'package:themovieapp/widgets/rating_view.dart';
import 'package:themovieapp/widgets/title_text.dart';

import '../data/vos/movie_vo.dart';
import '../network/api_constants.dart';
import '../resources/dimens.dart';

class TitleAndHorizontalMovieListView extends StatelessWidget {

  final Function onTapMovie;
  final String title;
  final List<MovieVO> movieList;
  final Function onListEndReached;

  const TitleAndHorizontalMovieListView({
    Key? key, required this.onTapMovie, required this.title, required this.movieList, required this.onListEndReached,
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
            title: title,
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

class HorizontalMovieListView extends StatelessWidget {

  final Function onTapMovie;
  final List<MovieVO> movieList;
  final Function onListEndReached;

  const HorizontalMovieListView({
    Key? key, required this.onTapMovie, required this.movieList, required this.onListEndReached,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartListView(
      heigh: MOVIE_LIST_HEIGH,
      padding: MARGIN_MEDIUM_2X,
      itemsLength: movieList.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieItemView(
          onTapMovie: onTapMovie,
          movie: movieList[index],
        );
      },
      onListEndReached: onListEndReached,
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
              IMAGE_BASE_URL + "${movie.posterPath}",
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
