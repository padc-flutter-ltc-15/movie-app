
import 'package:flutter/material.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/resources/strings.dart';

import '../data/vos/movie_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/title_text.dart';
import '../widgets/title_text_with_see_more.dart';

class ShowCasesSection extends StatelessWidget {

  final List<MovieVO> movieList;

  const ShowCasesSection({
    Key? key, required this.movieList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2X
          ),
          child: TitleTextWithSeeMore(
            title: MAIN_SCREEN_SHOW_CASES,
            seeMore: MAIN_SCREEN_SEE_MORE_SHOW_CASES,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2X,
        ),
        Container(
          height: MOVIE_LIST_HEIGH,
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2X),
          /*child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ShowCaseView(),
              ShowCaseView(),
              ShowCaseView(),
            ],
          ),*/
          child: ListView.builder( /// ListView
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return ShowCaseView(
                movie: movieList[index],
              );
            },
          ),
        )
      ],
    );
  }
}

class ShowCaseView extends StatelessWidget {
  final MovieVO movie;

  const ShowCaseView({
    Key? key, required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SHOW_CASE_ITEM_WIDTH,
      padding: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "$IMAGE_BASE_URL${movie.posterPath}",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.play_arrow,
              size: BANNER_PLAY_BUTTON_SIZE,
              color: PLAY_BUTTON_COLOR,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_2X),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, /// stick to bottom
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_SMALL,
                  ),
                  TitleText(title: movie.releaseDate)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}