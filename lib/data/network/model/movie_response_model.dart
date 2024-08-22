import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response_model.freezed.dart';
part 'movie_response_model.g.dart';

@freezed
class MovieListResponse with _$MovieListResponse {
  const factory MovieListResponse({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'results') List<MovieResponse>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _MovieListResponse;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);
}

@freezed
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'video') bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
