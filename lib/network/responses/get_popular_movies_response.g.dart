// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_popular_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPopularMoviesResponse _$GetPopularMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    GetPopularMoviesResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int?,
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$GetPopularMoviesResponseToJson(
        GetPopularMoviesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
