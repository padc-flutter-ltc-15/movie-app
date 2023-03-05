// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_top_rated_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTopRatedMoviesResponse _$GetTopRatedMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    GetTopRatedMoviesResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int?,
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$GetTopRatedMoviesResponseToJson(
        GetTopRatedMoviesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
