import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuncie_flutter_test/common/model/paged_list.dart';
import 'package:kuncie_flutter_test/data/mapper/genre_response_mapper.dart';
import 'package:kuncie_flutter_test/data/mapper/movie_response_mapper.dart';
import 'package:kuncie_flutter_test/data/model/genre.dart';
import 'package:kuncie_flutter_test/data/network/movie_network_data_source.dart';

import 'model/movie.dart';

class MovieRepository {
  MovieRepository(this._movieNetworkDataSource);

  static final provider = Provider(
    (ref) => MovieRepository(ref.watch(MovieNetworkDataSource.provider)),
  );

  final MovieNetworkDataSource _movieNetworkDataSource;

  String? _posterBaseUrl;

  List<Genre> _genre = [];

  Future<PagedList<int, Movie>> getPopularMovies({int page = 1}) async {
    final response = await _movieNetworkDataSource.getPopularMovies(page: page);
    final hasNextPage = page < (response.totalPages ?? 0);
    final nextPage = hasNextPage ? page + 1 : -1;
    final posterBaseUrl = await _getPosterBaseUrl();
    final genres = await _getGenres();

    return PagedList(
      nextPage,
      response.results
              ?.map((item) => item.toDomainModel(posterBaseUrl, genres))
              .toList() ??
          <Movie>[],
    );
  }

  Future<PagedList<int, Movie>> searchMovies({
    required String query,
    int page = 1,
  }) async {
    final response = await _movieNetworkDataSource.searchMovies(
      query: query,
      page: page,
    );
    final hasNextPage = page < (response.totalPages ?? 0);
    final nextPage = hasNextPage ? page + 1 : -1;
    final posterBaseUrl = await _getPosterBaseUrl();
    final genres = await _getGenres();

    return PagedList(
      nextPage,
      response.results
              ?.map((item) => item.toDomainModel(posterBaseUrl, genres))
              .toList() ??
          <Movie>[],
    );
  }

  Future<String> _getPosterBaseUrl() async {
    if (_posterBaseUrl == null) {
      final response = await _movieNetworkDataSource.getConfig();
      _posterBaseUrl =
          '${response.images?.secureBaseUrl}${response.images?.posterSizes?.last}';
    }

    return _posterBaseUrl ?? '';
  }

  Future<List<Genre>> _getGenres() async {
    if (_genre.isEmpty) {
      final response = await _movieNetworkDataSource.getGenres();
      _genre =
          response.genres?.map((item) => item.toDomainModel()).toList() ?? [];
    }

    return _genre;
  }
}
