// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_genres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieGenresResponse _$GetMovieGenresResponseFromJson(
        Map<String, dynamic> json) =>
    GetMovieGenresResponse(
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMovieGenresResponseToJson(
        GetMovieGenresResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
