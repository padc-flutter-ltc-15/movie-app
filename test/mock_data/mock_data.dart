
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/network/responses/get_movie_details_credits_response.dart';

List<MovieVO> getMockMoviesForTest() {
  return [
    MovieVO(true, null, [], 1, "", "Shazam", "Shazam", null, null, null, "Shazam", null, null, null, true, false, false),
    MovieVO(true, null, [], 2, "", "Superman", "Superman", null, null, null, "Superman", null, null, null, false, true, false),
    MovieVO(true, null, [], 3, "", "Batman", "Batman", null, null, null, "Batman", null, null, null, false, false, true),
    MovieVO(true, null, [], 4, "", "Flash", "Flash", null, null, null, "Flash", null, null, null, true, false, false),
    MovieVO(true, null, [], 5, "", "Wonder Woman", "Wonder Woman", null, null, null, "Wonder Woman", null, null, null, true, false, false),
  ];
}

GetMovieDetailsCreditsResponse getMockMovieDetailsCreditsResponse() {
  return GetMovieDetailsCreditsResponse(
    1,
    getMockActors(),
    getMockActors(),
  );
}

List<ActorVO> getMockActors() {
  return [
    ActorVO(1, "Keanu Reeves", null),
    ActorVO(2, "Leonardo Dicaprio", null),
    ActorVO(3, "Jacky Chan", null),
    ActorVO(4, "Brad Pitt", null),
    ActorVO(5, "Hugh Jackman", null),
  ];
}

List<GenreVO> getMockGenres() {
  return [
    GenreVO(1, "Action"),
    GenreVO(2, "Drama"),
    GenreVO(4, "Comedy"),
    GenreVO(5, "Biography"),
    GenreVO(6, "Si-fi"),
  ];
}
