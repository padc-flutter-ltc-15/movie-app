
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/movie_vo.dart';

part 'get_movies_by_genre_response.g.dart';

@JsonSerializable()
class GetMoviesByGenreResponse {
  @JsonKey(name: "results")
  List<MovieVO>? results;
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  GetMoviesByGenreResponse(
      this.results,
      this.page,
      this.totalPages,
      this.totalResults);

  factory GetMoviesByGenreResponse.fromJson(Map<String, dynamic> json) => _$GetMoviesByGenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMoviesByGenreResponseToJson(this);
}