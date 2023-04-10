import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themovieapp/bloc/home_bloc.dart';
import 'package:themovieapp/data/models/movie_model.dart';
import 'package:themovieapp/data/models/movie_model_impl.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/resources/colors.dart';
import 'package:themovieapp/resources/dimens.dart';
import 'package:themovieapp/resources/strings.dart';
import 'package:themovieapp/screens/detail_screen.dart';
import 'package:themovieapp/views/genre_view.dart';
import '../views/actors_and_creators_view.dart';
import '../views/banner_view.dart';
import '../views/check_movie_show_time_view.dart';
import '../views/movie_view.dart';
import '../views/showcase_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HOME_SCREEN_BG_COLOR,
          title: const Text(
            MAIN_SCREEN_APP_BAR_TITLE,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: const Icon(
            Icons.menu,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(
                  top: 0, bottom: 0, left: 0, right: MARGIN_MEDIUM_2X),
              child: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: Container(
          color: PRIMARY_COLOR,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<HomeBloc>(
                  builder: (context, bloc, child) {
                    return BannerSection(
                      movieList: bloc.nowPlayingMovies.take(5).toList(),
                    );
                  },
                ), /// Banner
                SizedBox(
                  height: MARGIN_MEDIUM_2X,
                ),
                Consumer<HomeBloc>(
                  builder: (context, bloc, child) {
                    return BestPopularMoviesAndSeriesSection(
                      onTapMovie: (int id) => _navigateToDetailScreen(context, id),
                      movieList: bloc.popularMovies,
                    );
                  },
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2X,
                ),
                CheckMovieShowTimeSection(),
                Consumer<HomeBloc>(
                  builder: (context, bloc, child) {
                    return GenreSection(
                      genreList: bloc.genres,
                      movieList: bloc.moviesByGenre,
                      onTabMovie: (int id) => _navigateToDetailScreen(context, id),
                      onTabGenre: (id) {
                        bloc.getMoviesByGenre(id);
                      },
                    );
                  },
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2X,
                ),
                Consumer<HomeBloc>(
                  builder: (context, bloc, child) {
                    return ShowCasesSection(
                      movieList: bloc.showcaseMovies,
                    );
                  }
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2X,
                ),
                Consumer<HomeBloc>(
                  builder: (context, bloc, child) {
                    return ActorsAndCreatorsSection(
                      title: MAIN_SCREEN_BEST_ACTORS,
                      seeMore: MAIN_SCREEN_SEE_MORE_ACTORS,
                      seeMoreVisibility: true,
                      actorList: bloc.actors,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToDetailScreen(BuildContext context, int id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(id: id,)));
  }
}
