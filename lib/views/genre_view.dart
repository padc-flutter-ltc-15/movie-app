
import 'package:flutter/material.dart';
import 'package:themovieapp/resources/colors.dart';

import '../resources/dimens.dart';
import 'movie_view.dart';

class GenreSection extends StatelessWidget {

  final List<String> genreList;
  final Function onTabMovie;

  const GenreSection({
    Key? key, required this.genreList, required this.onTabMovie,
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
                        child: Text(genre),
                      ),).toList(),
            ),
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2X,
        ),
        HorizontalMovieListView(
          onTapMovie: onTabMovie,
          movieList: [],
        ), /// Movie List
      ],
    );
  }
}