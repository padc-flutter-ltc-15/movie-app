
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

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:themovieapp/persistence/hive_constants.dart';

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
@HiveType(typeId: HIVE_TYPE_ID_MOVIE_VO, adapterName: "MovieVOAdapter")
class MovieVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;
  @JsonKey(name: "backdrop_path")
  @HiveField(1)
  String? backDropPath;
  @JsonKey(name: "genre_ids")
  @HiveField(2)
  List<int>? genreIds;
  @JsonKey(name: "id")
  @HiveField(3)
  int? id;
  @JsonKey(name: "original_language")
  @HiveField(4)
  String? originalLanguage;
  @JsonKey(name: "original_title")
  @HiveField(5)
  String? originalTitle;
  @JsonKey(name: "overview")
  @HiveField(6)
  String? overview;
  @JsonKey(name: "popularity")
  @HiveField(7)
  double? popularity;
  @JsonKey(name: "poster_path")
  @HiveField(8)
  String? posterPath;
  @JsonKey(name: "release_date")
  @HiveField(9)
  String? releaseDate;
  @JsonKey(name: "title")
  @HiveField(10)
  String title;
  @JsonKey(name: "video")
  @HiveField(11)
  bool? video;
  @JsonKey(name: "vote_average")
  @HiveField(12)
  double? voteAverage;
  @JsonKey(name: "vote_count")
  @HiveField(13)
  int? voteCount;

  @HiveField(14)
  bool? isNowPlaying;
  @HiveField(15)
  bool? isPopular;
  @HiveField(16)
  bool? isTopRated;

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
      this.voteCount,
      this.isTopRated,
      this.isPopular,
      this.isNowPlaying);

  factory MovieVO.fromJson(Map<String, dynamic> json) => _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backDropPath: $backDropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount}';
  }

  /// > flutter packages run build_runner build
}