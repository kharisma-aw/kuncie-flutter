import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuncie_flutter_test/data/model/genre.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required bool adult,
    required String backdropPath,
    required List<Genre> genres,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required DateTime? releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) = _Movie;
}
