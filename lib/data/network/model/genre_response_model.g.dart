// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenresResponseImpl _$$GenresResponseImplFromJson(Map<String, dynamic> json) =>
    _$GenresResponseImpl(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenresResponseImplToJson(
        _$GenresResponseImpl instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

_$GenreResponseImpl _$$GenreResponseImplFromJson(Map<String, dynamic> json) =>
    _$GenreResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$GenreResponseImplToJson(_$GenreResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
