
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/movie_vo.dart';

part 'get_popular_movies_response.g.dart';

@JsonSerializable()
class GetPopularMoviesResponse {
  @JsonKey(name: "results")
  List<MovieVO>? results;
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  GetPopularMoviesResponse(
      this.results,
      this.page,
      this.totalPages,
      this.totalResults);

  factory GetPopularMoviesResponse.fromJson(Map<String, dynamic> json) => _$GetPopularMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPopularMoviesResponseToJson(this);
}