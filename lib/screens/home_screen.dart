import 'package:flutter/material.dart';
import 'package:themovieapp/data/models/movie_model.dart';
import 'package:themovieapp/data/models/movie_model_impl.dart';
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

  MovieModel movieModel = MovieModelImpl();

  List<MovieVO>? nowPlayingMovieList;

  /// Network call are write in this initState()
  /// Because it will not refresh every time Widget is refreshed
  @override
  void initState() {
    movieModel.getNowPlayingMovies()
    .then((value) {
      setState(() {
        nowPlayingMovieList = value;
      });
    })
    .catchError((error) {
      debugPrint(error.toString());
    });
    super.initState();
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
              BannerSection(), /// Banner
              SizedBox(
                height: MARGIN_MEDIUM_2X,
              ),
              BestPopularMoviesAndSeriesSection(
                onTapMovie: () => _navigateToDetailScreen(context),
                movieList: (nowPlayingMovieList != null) ? nowPlayingMovieList! : [],
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2X,
              ),
              CheckMovieShowTimeSection(),
              GenreSection(
                genreList: [
                  "Horror",
                  "Funny",
                  "Biography",
                  "Trilogy",
                  "Sport",
                  "Hollywood",
                  "Asian",
                  "Bollywood"
                ],
                onTabMovie: () => _navigateToDetailScreen(context),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2X,
              ),
              ShowCasesSection(),
              SizedBox(
                height: MARGIN_MEDIUM_2X,
              ),
              ActorsAndCreatorsSection(
                title: MAIN_SCREEN_BEST_ACTORS,
                seeMore: MAIN_SCREEN_SEE_MORE_ACTORS,
                seeMoreVisibility: true,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetailScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
  }
}
