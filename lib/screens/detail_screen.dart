
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themovieapp/bloc/detail_bloc.dart';
import 'package:themovieapp/bloc/home_bloc.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/resources/colors.dart';
import 'package:themovieapp/resources/dimens.dart';
import 'package:themovieapp/resources/strings.dart';
import 'package:themovieapp/widgets/gradient_view.dart';
import 'package:themovieapp/widgets/rating_view.dart';
import 'package:themovieapp/widgets/title_text.dart';

import '../data/vos/actor_vo.dart';
import '../views/actors_and_creators_view.dart';
import '../widgets/title_and_horizontal_movie_list_view.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailBloc(id),
      child: Scaffold(
        body: Selector<DetailBloc, MovieVO?>(
          selector: (context, bloc) => bloc.movieDetail,
          builder: (context, movieDetailValue, child) {
            return Container(
              color: HOME_SCREEN_BG_COLOR,
              child: CustomScrollView(
                slivers: [
                  MovieDetailSliverAppBarView(
                    onTapBack: () {
                      Navigator.pop(context);
                    },
                    movie: movieDetailValue,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                        [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2X),
                            child: Column(
                              children: [
                                Selector<DetailBloc, List<GenreVO>>(
                                  selector: (context, bloc) => bloc.genres,
                                  builder: (context, value, child) {
                                    return TrailerSection(
                                      genreList: value,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: MARGIN_MEDIUM,
                                ),
                                StoryLineView(
                                  text: movieDetailValue?.overview??"",
                                ),
                                SizedBox(
                                  height: MARGIN_MEDIUM_2X,
                                ),
                                Row(
                                  children: [
                                    MovieDetailScreenButtonView(
                                      title: "Play Trailer",
                                      icon: Icons.play_circle_fill,
                                      iconColor: Colors.black54,
                                      backgroundColor: Colors.amber,
                                      isGhostButton: false,
                                    ),
                                    SizedBox(
                                      width: MARGIN_MEDIUM,
                                    ),
                                    MovieDetailScreenButtonView(
                                      title: "Rate Movie",
                                      icon: Icons.star,
                                      iconColor: Colors.amber,
                                      backgroundColor: HOME_SCREEN_BG_COLOR,
                                      isGhostButton: true,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2X,
                          ),
                          Selector<DetailBloc, List<ActorVO>>(
                            selector: (context, bloc) => bloc.actors,
                            builder: (context, value, child) {
                              return ActorsAndCreatorsSection(
                                title: MAIN_SCREEN_CREATORS,
                                seeMore: MAIN_SCREEN_SEE_MORE_CREATORS,
                                actorList: value,
                              );
                            },
                          ),
                          SizedBox(
                            height: MARGIN_LARGE,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2X),
                            child: AboutFilmSection(
                              movie: movieDetailValue,
                            ),
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2X,
                          ),
                          Selector<DetailBloc, List<ActorVO>>(
                            selector: (context, bloc) => bloc.creators,
                            builder: (context, value, child) {
                              return ActorsAndCreatorsSection(
                                title: MAIN_SCREEN_CREATORS,
                                seeMore: MAIN_SCREEN_SEE_MORE_CREATORS,
                                actorList: value,
                              );
                            },
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2X,
                          ),
                          Selector<DetailBloc, List<MovieVO>>(
                            selector: (context, bloc) => bloc.relatedMovies,
                            builder: (context, value, child) {
                              return TitleAndHorizontalMovieListView(
                                onTapMovie: (int id) => _navigateToDetailScreen(context, id),
                                movieList: value,
                                title: DETAIL_SCREEN_RELATED_MOVIES_AND_SERIES,
                                onListEndReached: () {
                                  var detailBloc = Provider.of<DetailBloc>(context, listen: false);
                                  detailBloc.fetchRelatedMovies();
                                },
                              );
                            },
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToDetailScreen(BuildContext context, int id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(id: id,)));
  }
}

class AboutFilmSection extends StatelessWidget {
  final MovieVO? movie;

  const AboutFilmSection({
    Key? key, required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: "ABOUT FILM"),
        SizedBox(
          height: MARGIN_MEDIUM_2X,
        ),
        AboutFilmInfoView(
          title: "Original Title",
          description: movie?.title??"",
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        AboutFilmInfoView(
          title: "Type",
          description: "Family, Fantansy, Action",
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        AboutFilmInfoView(
          title: "Production",
          description: "Hollywood",
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        AboutFilmInfoView(
          title: "Premiere",
          description: movie?.releaseDate??"",
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        AboutFilmInfoView(
          title: "Description",
          description: movie?.overview??"",
        )
      ],
    );
  }
}

class AboutFilmInfoView extends StatelessWidget {
  final String title;
  final String description;

  const AboutFilmInfoView({
    Key? key, required this.title, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4, /// Set width as 1/4 of screen width
          child: Text(
            title,
            style: TextStyle(
              color: DETAIL_SCREEN_INFO_TEXT_COLOR,
              fontSize: MARGIN_MEDIUM_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2X,
        ),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: MARGIN_MEDIUM_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class MovieDetailScreenButtonView extends StatelessWidget {

  final String title;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final bool isGhostButton;

  const MovieDetailScreenButtonView({
    Key? key, required this.title, required this.icon, required this.iconColor, required this.backgroundColor, required this.isGhostButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2X),
        border: (isGhostButton)? Border.all(
          color: Colors.white,
          width: 2,
        ): null
      ),
      padding: EdgeInsets.only(
        top: MARGIN_SMALL,
        bottom: MARGIN_SMALL,
        left: MARGIN_MEDIUM_2X,
        right: MARGIN_MEDIUM_2X,
      ),
      height: MARGIN_LARGE_3X,
      child: Center(
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(
              width: MARGIN_SMALL,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryLineView extends StatelessWidget {
  final String text;

  const StoryLineView({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: DETAIL_SCREEN_STORY_LINE_TITLE),
        SizedBox(
          height: MARGIN_SMALL,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
      ],
    );
  }
}

class TrailerSection extends StatelessWidget {

  final List<GenreVO>? genreList;

  const TrailerSection({
    Key? key, required this.genreList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          color: Colors.amber,
        ),
        SizedBox(
          width: MARGIN_SMALL,
        ),
        Text(
          "2hr 40min",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: TEXT_REGULAR,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Row(
          children: genreList?.map((genre) => GenreChipView(name: genre.name)).toList()??[],
        ),
        Spacer(),
        Icon(
          Icons.favorite_border,
          color: Colors.white,
        ),
      ],
    );
  }
}

class GenreChipView extends StatelessWidget {

  final String name;

  const GenreChipView({
    Key? key, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          backgroundColor: DETAIL_SCREEN_CHIP_BG_COLOR,
          label: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: TEXT_REGULAR,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        )
      ],
    );
  }
}

class MovieDetailSliverAppBarView extends StatelessWidget {
  final MovieVO? movie;

  final Function onTapBack;

  const MovieDetailSliverAppBarView({
    Key? key, required this.onTapBack, this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: HOME_SCREEN_BG_COLOR,
      automaticallyImplyLeading: false, /// To hide back button
      expandedHeight: DETAIL_SCREEN_SLIVER_APP_BAR_HEIGH,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          Positioned.fill(
            child: Image.network(
              "$IMAGE_BASE_URL${movie?.posterPath??""}",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: GradientView(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: MARGIN_LARGE_2X,
                left: MARGIN_MEDIUM_2X,
              ),
              child: BackButtonView(
                onTapBack: onTapBack,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: MARGIN_LARGE_2X + MARGIN_SMALL,
                right: MARGIN_MEDIUM_2X,
              ),
              child: SearchButtonView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: MARGIN_MEDIUM_2X,
                right: MARGIN_MEDIUM_2X,
                bottom: MARGIN_LARGE,
              ),
              child: MovieDetailAppBarInfoView(movie: movie,),
            ),
          ),
        ]),
      ),
    );
  }
}

class MovieDetailAppBarInfoView extends StatelessWidget {
  final MovieVO? movie;

  const MovieDetailAppBarInfoView({
    Key? key, this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, /// To make sure gravity text to bottom
      children: [
        Row(
          children: [
            MovieDetailYearView(
              text: movie?.releaseDate??"",
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    RatingView(),
                    SizedBox(
                      height: MARGIN_SMALL,
                    ),
                    TitleText(title: (movie?.voteCount??0).toString() + " Votes"),
                    SizedBox(
                      height: MARGIN_MEDIUM_2X,
                    ),
                  ],
                ),
                SizedBox(
                  width: MARGIN_MEDIUM,
                ),
                Text(
                  (movie?.voteAverage??0).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: DETAIL_SCREEN_RATING_TEXT_SIZE
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2X,
        ),
        Text(
          movie?.title??"",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_HEADING_2X,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}

class MovieDetailYearView extends StatelessWidget {
  final String text;

  const MovieDetailYearView({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_LARGE_2X,
      decoration: BoxDecoration(
        color: PLAY_BUTTON_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_LARGE),
      ),
      child: Padding(
        padding: EdgeInsets.all(MARGIN_MEDIUM),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

class SearchButtonView extends StatelessWidget {
  const SearchButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      color: Colors.white,
      size: MARGIN_LARGE_2X,
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function onTapBack;

  const BackButtonView({
    Key? key, required this.onTapBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBack();
      },
      child: Container(
        width: MARGIN_LARGE_3X,
        height: MARGIN_LARGE_3X,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: MARGIN_LARGE_2X,
        ),
      ),
    );
  }
}
