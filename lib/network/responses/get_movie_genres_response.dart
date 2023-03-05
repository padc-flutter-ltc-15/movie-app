
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/genre_vo.dart';

part 'get_movie_genres_response.g.dart';

/*
{
    "genres": [
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 12,
            "name": "Adventure"
        }
    ]
}
 */
@JsonSerializable()
class GetMovieGenresResponse {
  @JsonKey(name: "genres")
  List<GenreVO>? genres;

  GetMovieGenresResponse(this.genres);

  factory GetMovieGenresResponse.fromJson(Map<String, dynamic> json) => _$GetMovieGenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieGenresResponseToJson(this);
}