
import 'package:json_annotation/json_annotation.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';

import '../../data/vos/date_vo.dart';

part 'get_now_playing_movies_response.g.dart';

/*
{
  "dates": {
        "maximum": "2023-03-09",
        "minimum": "2023-01-20"
    },
    "page": 1,
    "results": [],
    "total_pages": 73,
    "total_results": 1453
}
 */
@JsonSerializable()
class GetNowPlayingMoviesResponse {
  @JsonKey(name: "dates")
  DateVO? dates;
  @JsonKey(name: "results")
  List<MovieVO>? results;
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  GetNowPlayingMoviesResponse(
      this.dates,
      this.results,
      this.page,
      this.totalPages,
      this.totalResults);

  factory GetNowPlayingMoviesResponse.fromJson(Map<String, dynamic> json) => _$GetNowPlayingMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNowPlayingMoviesResponseToJson(this);

}