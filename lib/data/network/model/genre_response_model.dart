import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_response_model.freezed.dart';
part 'genre_response_model.g.dart';

@freezed
class GenresResponse with _$GenresResponse {
  const factory GenresResponse({
    @JsonKey(name: 'genres') List<GenreResponse>? genres,
  }) = _GenresResponse;

  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);
}

@freezed
class GenreResponse with _$GenreResponse {
  const factory GenreResponse({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _GenreResponse;

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);
}
