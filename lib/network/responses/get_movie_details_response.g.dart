// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieDetailsResponse _$GetMovieDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetMovieDetailsResponse(
      json['adult'] as bool,
      json['backdrop_path'] as String,
      (json['genres'] as List<dynamic>)
          .map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int,
      json['original_language'] as String,
      json['original_title'] as String,
      json['overview'] as String,
      (json['popularity'] as num).toDouble(),
      json['poster_path'] as String,
      json['release_date'] as String,
      json['title'] as String,
      json['video'] as bool,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
    )
      ..isNowPlaying = json['isNowPlaying'] as bool?
      ..isPopular = json['isPopular'] as bool?
      ..isTopRated = json['isTopRated'] as bool?;

Map<String, dynamic> _$GetMovieDetailsResponseToJson(
        GetMovieDetailsResponse instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backDropPath,
      'genres': instance.genres,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'isNowPlaying': instance.isNowPlaying,
      'isPopular': instance.isPopular,
      'isTopRated': instance.isTopRated,
    };
