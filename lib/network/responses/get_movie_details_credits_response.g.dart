// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_details_credits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieDetailsCreditsResponse _$GetMovieDetailsCreditsResponseFromJson(
        Map<String, dynamic> json) =>
    GetMovieDetailsCreditsResponse(
      json['id'] as int,
      (json['cast'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMovieDetailsCreditsResponseToJson(
        GetMovieDetailsCreditsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
