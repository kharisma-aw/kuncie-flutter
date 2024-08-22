import 'package:kuncie_flutter_test/data/model/genre.dart';
import 'package:kuncie_flutter_test/data/model/movie.dart';
import 'package:kuncie_flutter_test/data/network/model/movie_response_model.dart';

extension MovieResponseMapper on MovieResponse {
  Movie toDomainModel(String posterBaseUrl, List<Genre> genres) {
    return Movie(
      adult: adult ?? false,
      backdropPath: backdropPath ?? '',
      genres: genreIds
              ?.map((item) => genres.firstWhere((genre) => genre.id == item))
              .toList() ??
          [],
      id: id ?? -1,
      originalLanguage: originalLanguage ?? '',
      originalTitle: originalTitle ?? '',
      overview: overview ?? '',
      popularity: popularity ?? 0,
      posterPath: '$posterBaseUrl$posterPath',
      releaseDate: releaseDate != null ? DateTime.tryParse(releaseDate!) : null,
      title: title ?? '',
      video: video ?? false,
      voteAverage: voteAverage ?? 0,
      voteCount: voteCount ?? 0,
    );
  }
}
