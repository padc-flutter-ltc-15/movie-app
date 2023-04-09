import 'package:flutter/material.dart';
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
import '../data/vos/movie_vo.dart';
import '../views/actors_and_creators_view.dart';
import '../views/banner_view.dart';
import '../views/check_movie_show_time_view.dart';
import '../views/movie_view.dart';
import '../views/showcase_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              StreamBuilder(
                stream: _bloc.popularMoviesStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<MovieVO>> snapshot) {
                  return BannerSection(
                    movieList: snapshot.data?.take(5).toList()??[],
                  );
                },
              ), /// Banner
              SizedBox(
                height: MARGIN_MEDIUM_2X,
              ),
              StreamBuilder(
                stream: _bloc.nowPlayingMoviesStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<MovieVO>> snapshot) {
                  return BestPopularMoviesAndSeriesSection(
                    onTapMovie: (int id) => _navigateToDetailScreen(context, id),
                    movieList: snapshot.data??[],
                  );
                },
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2X,
              ),
              CheckMovieShowTimeSection(),
              StreamBuilder(
                stream: _bloc.genresStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<GenreVO>> genresSnapshot) {
                  return StreamBuilder(
                    stream: _bloc.moviesByGenreIdsStreamController.stream,
                    builder: (BuildContext context, AsyncSnapshot<List<MovieVO>> moviesSnapshot) {
                      return GenreSection(
                        genreList: genresSnapshot.data??[],
                        movieList: moviesSnapshot.data??[],
                        onTabMovie: (int id) => _navigateToDetailScreen(context, id),
                        onTabGenre: (id) {
                          _bloc.getMoviesByGenre(id);
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2X,
              ),
              StreamBuilder(
                stream: _bloc.showCaseMoviesStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<MovieVO>> snapshot) {
                  return ShowCasesSection(
                    movieList: snapshot.data??[],
                  );
                },
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2X,
              ),
              StreamBuilder(
                stream: _bloc.actorsStreamController.stream,
                builder: (BuildContext context, AsyncSnapshot<List<ActorVO>> snapshot) {
                  return ActorsAndCreatorsSection(
                    title: MAIN_SCREEN_BEST_ACTORS,
                    seeMore: MAIN_SCREEN_SEE_MORE_ACTORS,
                    seeMoreVisibility: true,
                    actorList: snapshot.data??[],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetailScreen(BuildContext context, int id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(id: id,)));
  }
}
