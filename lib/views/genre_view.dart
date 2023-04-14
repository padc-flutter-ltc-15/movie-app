
import 'package:flutter/material.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/resources/colors.dart';

import '../resources/dimens.dart';
import '../widgets/title_and_horizontal_movie_list_view.dart';
import 'movie_view.dart';

class GenreSection extends StatelessWidget {

  final List<GenreVO> genreList;
  final List<MovieVO> movieList;
  final Function onTabMovie;
  final Function onTabGenre;
  final Function onListEndReached;

  const GenreSection({
    Key? key, required this.genreList, required this.onTabMovie, required this.movieList, required this.onTabGenre, required this.onListEndReached,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2X),
          child: DefaultTabController(
            length: genreList.length,
            child: TabBar(
              isScrollable: true,
              indicatorColor: PLAY_BUTTON_COLOR,
              unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
              tabs: genreList.map(
                      (genre) => Tab(
                        child: Text(genre.name),
                      ),
              ).toList(),
              onTap: (index) {
                onTabGenre(genreList[index].id);
              },
            ),
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2X,
        ),
        HorizontalMovieListView(
          onTapMovie: onTabMovie,
          movieList: movieList,
          onListEndReached: onListEndReached,
        ), /// Movie List
      ],
    );
  }
}