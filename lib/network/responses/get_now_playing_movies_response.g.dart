// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_now_playing_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNowPlayingMoviesResponse _$GetNowPlayingMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    GetNowPlayingMoviesResponse(
      json['dates'] == null
          ? null
          : DateVO.fromJson(json['dates'] as Map<String, dynamic>),
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int?,
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$GetNowPlayingMoviesResponseToJson(
        GetNowPlayingMoviesResponse instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'results': instance.results,
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
