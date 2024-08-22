import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuncie_flutter_test/data/network/http_client.dart';
import 'package:kuncie_flutter_test/data/network/model/config_response_model.dart';
import 'package:kuncie_flutter_test/data/network/model/genre_response_model.dart';

import 'model/movie_response_model.dart';

class MovieNetworkDataSource {
  MovieNetworkDataSource(this._client);

  static final provider = Provider((ref) {
    return MovieNetworkDataSource(ref.watch(HttpClient.provider));
  });

  final HttpClient _client;

  final _configEndpoint = '/3/configuration';
  final _movieGenreEndpoint = '/3/genre/movie/list';
  final _popularMoviesEndpoint = '/3/movie/popular';
  final _searchMoviesEndpoint = '/3/search/movie';

  Future<MovieListResponse> getPopularMovies({int page = 1}) async {
    final response = await _client.get<Map<String, dynamic>>(
      path: _popularMoviesEndpoint,
      queryParameters: {
        'page': page,
      },
    );

    return MovieListResponse.fromJson(response);
  }

  Future<MovieListResponse> searchMovies({
    required String query,
    int page = 1,
  }) async {
    final response = await _client.get<Map<String, dynamic>>(
      path: _searchMoviesEndpoint,
      queryParameters: {
        'query': query,
        'page': page,
      },
    );

    return MovieListResponse.fromJson(response);
  }

  Future<ConfigResponse> getConfig() async {
    final response = await _client.get<Map<String, dynamic>>(
      path: _configEndpoint,
    );

    return ConfigResponse.fromJson(response);
  }

  Future<GenresResponse> getGenres() async {
    final response = await _client.get<Map<String, dynamic>>(
      path: _movieGenreEndpoint,
    );

    return GenresResponse.fromJson(response);
  }
}
