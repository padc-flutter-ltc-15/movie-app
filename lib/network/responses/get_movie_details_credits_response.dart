
import 'package:json_annotation/json_annotation.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';

part 'get_movie_details_credits_response.g.dart';

@JsonSerializable()
class GetMovieDetailsCreditsResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "cast")
  List<ActorVO>? cast;
  @JsonKey(name: "crew")
  List<ActorVO>? crew;

  GetMovieDetailsCreditsResponse(
      this.id,
      this.cast,
      this.crew
      );

  factory GetMovieDetailsCreditsResponse.fromJson(Map<String, dynamic> json) => _$GetMovieDetailsCreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieDetailsCreditsResponseToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetMovieDetailsCreditsResponse &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}