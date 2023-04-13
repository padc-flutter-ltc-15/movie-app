import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themovieapp/bloc/home_bloc.dart';
import 'package:themovieapp/data/models/movie_model.dart';
import 'package:themovieapp/data/models/movie_model_impl.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/resources/colors.dart';
import 'package:themovieapp/resources/dimens.dart';
import 'package:themovieapp/resources/strings.dart';
import 'package:themovieapp/screens/detail_screen.dart';
import 'package:themovieapp/views/genre_view.dart';
import 'package:themovieapp/widgets/title_and_horizontal_movie_list_view.dart';
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
                Selector<HomeBloc, List<MovieVO>>(
                  selector: (context, bloc) => bloc.nowPlayingMovies,
                  builder: (context, value, child) {
                    return BannerSection(
                      movieList: value.take(5).toList(),
                    );
                  },
                ), /// Banner
                SizedBox(
                  height: MARGIN_MEDIUM_2X,
                ),
                Selector<HomeBloc, List<MovieVO>>(
                  selector: (context, bloc) => bloc.popularMovies,
                  builder: (context, value, child) {
                    return TitleAndHorizontalMovieListView(
                      onTapMovie: (int id) => _navigateToDetailScreen(context, id),
                      movieList: value,
                      title: MAIN_SCREEN_BEST_POPULAR_MOVIES_AND_SERIES,
                    );
                  },
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2X,
                ),
                CheckMovieShowTimeSection(),
                Selector<HomeBloc, List<GenreVO>>(
                  selector: (context, bloc) => bloc.genres,
                  builder: (context, genresValue, child) {
                    return Selector<HomeBloc, List<MovieVO>>(
                      selector: (context, bloc) => bloc.moviesByGenre,
                      builder: (context, moviesByGenreValue, child) {
                        return GenreSection(
                          genreList: genresValue,
                          movieList: moviesByGenreValue,
                          onTabMovie: (int id) => _navigateToDetailScreen(context, id),
                          onTabGenre: (id) {
                            var homeBloc = Provider.of<HomeBloc>(context, listen: false);
                            homeBloc.getMoviesByGenre(id);
                          },
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2X,
                ),
                Selector<HomeBloc, List<MovieVO>>(
                  selector: (context, bloc) => bloc.showcaseMovies,
                  builder: (context, value, child) {
                    return ShowCasesSection(
                      movieList: value,
                    );
                  },
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2X,
                ),
                Selector<HomeBloc, List<ActorVO>>(
                  selector: (context, bloc) => bloc.actors,
                  builder: (context, value, child) {
                    return ActorsAndCreatorsSection(
                      title: MAIN_SCREEN_BEST_ACTORS,
                      seeMore: MAIN_SCREEN_SEE_MORE_ACTORS,
                      seeMoreVisibility: true,
                      actorList: value,
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
