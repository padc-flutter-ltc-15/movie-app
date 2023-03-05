
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/movie_vo.dart';

part 'get_top_rated_movies_response.g.dart';

@JsonSerializable()
class GetTopRatedMoviesResponse {
  @JsonKey(name: "results")
  List<MovieVO>? results;
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  GetTopRatedMoviesResponse(
      this.results,
      this.page,
      this.totalPages,
      this.totalResults);

  factory GetTopRatedMoviesResponse.fromJson(Map<String, dynamic> json) => _$GetTopRatedMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTopRatedMoviesResponseToJson(this);
}