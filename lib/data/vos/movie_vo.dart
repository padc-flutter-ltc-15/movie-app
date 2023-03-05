
/*
{
            "adult": false,
            "backdrop_path": "/22z44LPkMyf5nyyXvv8qQLsbom.jpg",
            "genre_ids": [
                27,
                9648,
                53
            ],
            "id": 631842,
            "original_language": "en",
            "original_title": "Knock at the Cabin",
            "overview": "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.",
            "popularity": 4112.616,
            "poster_path": "/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg",
            "release_date": "2023-02-01",
            "title": "Knock at the Cabin",
            "video": false,
            "vote_average": 6.5,
            "vote_count": 670
        }
 */

import 'package:json_annotation/json_annotation.dart';

part 'movie_vo.g.dart';

/*
{
            "adult": false,
            "backdrop_path": "/22z44LPkMyf5nyyXvv8qQLsbom.jpg",
            "genre_ids": [
                27,
                9648,
                53
            ],
            "id": 631842,
            "original_language": "en",
            "original_title": "Knock at the Cabin",
            "overview": "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.",
            "popularity": 4286.16,
            "poster_path": "/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg",
            "release_date": "2023-02-01",
            "title": "Knock at the Cabin",
            "video": false,
            "vote_average": 6.6,
            "vote_count": 751
        }
 */
@JsonSerializable()
class MovieVO {
  @JsonKey(name: "adult")
  bool adult;
  @JsonKey(name: "backdrop_path")
  String backDropPath;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
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

  MovieVO(
      this.adult,
      this.backDropPath,
      this.genreIds,
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
      this.voteCount);

  factory MovieVO.fromJson(Map<String, dynamic> json) => _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backDropPath: $backDropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount}';
  }

  /// > flutter packages run build_runner build
}