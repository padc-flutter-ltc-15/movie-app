
import 'package:json_annotation/json_annotation.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';

import '../../data/vos/genre_vo.dart';

part 'get_movie_details_response.g.dart';

/*
{
    "adult": false,
    "backdrop_path": "/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg",
    "belongs_to_collection": null,
    "budget": 190000000,
    "genres": [
        {
            "id": 16,
            "name": "Animation"
        },
        {
            "id": 10751,
            "name": "Family"
        },
        {
            "id": 35,
            "name": "Comedy"
        },
        {
            "id": 14,
            "name": "Fantasy"
        }
    ],
    "homepage": "https://www.disneyplus.com/movies/turning-red/4mFPCXJi7N2m",
    "id": 508947,
    "imdb_id": "tt8097030",
    "original_language": "en",
    "original_title": "Turning Red",
    "overview": "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.",
    "popularity": 306.021,
    "poster_path": "/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg",
    "production_companies": [
        {
            "id": 2,
            "logo_path": "/wdrCwmRnLFJhEoH8GSfymY85KHT.png",
            "name": "Walt Disney Pictures",
            "origin_country": "US"
        },
        {
            "id": 3,
            "logo_path": "/1TjvGVDMYsj6JBxOAkUHpPEwLf7.png",
            "name": "Pixar",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2022-03-10",
    "revenue": 18879922,
    "runtime": 100,
    "spoken_languages": [
        {
            "english_name": "Cantonese",
            "iso_639_1": "cn",
            "name": "广州话 / 廣州話"
        },
        {
            "english_name": "Mandarin",
            "iso_639_1": "zh",
            "name": "普通话"
        },
        {
            "english_name": "Korean",
            "iso_639_1": "ko",
            "name": "한국어/조선말"
        },
        {
            "english_name": "French",
            "iso_639_1": "fr",
            "name": "Français"
        },
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "Growing up is a beast.",
    "title": "Turning Red",
    "video": false,
    "vote_average": 7.494,
    "vote_count": 3946
}
 */
@JsonSerializable()
class GetMovieDetailsResponse {
  @JsonKey(name: "adult")
  bool adult;
  @JsonKey(name: "backdrop_path")
  String backDropPath;
  @JsonKey(name: "genres")
  List<GenreVO> genres;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "popularity")
  double popularity;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "video")
  bool video;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int voteCount;

  bool? isNowPlaying;
  bool? isPopular;
  bool? isTopRated;

  GetMovieDetailsResponse(
      this.adult,
      this.backDropPath,
      this.genres,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount
      );

  factory GetMovieDetailsResponse.fromJson(Map<String, dynamic> json) => _$GetMovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieDetailsResponseToJson(this);

  MovieVO toMovieVO() {
    List<int> genreIds = this.genres.map((item) => item.id).toList();

    return MovieVO(
      adult = this.adult,
      backDropPath = this.backDropPath,
      genreIds = genreIds,
      id = this.id,
      originalLanguage = this.originalLanguage,
      originalTitle = this.originalTitle,
      overview = this.overview,
      popularity = this.popularity,
      posterPath = this.posterPath,
      releaseDate = this.releaseDate,
      title = this.title,
      video = this.video,
      voteAverage = this.voteAverage,
      voteCount = this.voteCount,
      isTopRated = this.isTopRated,
      isPopular = this.isPopular,
      isNowPlaying = this.isNowPlaying
    );
  }
}