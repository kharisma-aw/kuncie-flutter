import 'dart:async';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuncie_flutter_test/common/model/paged_list.dart';
import 'package:kuncie_flutter_test/data/model/movie.dart';
import 'package:kuncie_flutter_test/data/movie_repository.dart';

part 'movie_list_controller.freezed.dart';

class MovieListController extends StateNotifier<MovieListScreenUiState> {
  MovieListController(this._movieRepository) : super(MovieListScreenUiState());

  static final provider = StateNotifierProvider.autoDispose<MovieListController,
      MovieListScreenUiState>((ref) {
    return MovieListController(
      ref.watch(MovieRepository.provider),
    );
  });

  final MovieRepository _movieRepository;

  Timer? _searchDebounce;

  String lastQueryWhenError = '';

  PagedList<int, Movie> _movieList = PagedList(1, []);

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }

  Future<void> getPopularMovies({bool isRefreshed = false}) async {
    if (!isRefreshed) {
      state = state.copyWith(movieListState: const AsyncValue.loading());
    }
    final result = _movieRepository.getPopularMovies();
    if (!mounted) return;
    result.then((data) {
      _movieList = data;
      state = state.copyWith(movieListState: AsyncData(_movieList.items));
    }).catchError((err, s) {
      state = state.copyWith(
        movieListState: AsyncError(err, s),
        errorAction: () {
          getPopularMovies(isRefreshed: isRefreshed);
          state = state.copyWith(errorAction: null);
        },
      );
    });
  }

  Future<void> _searchMovies({
    required String query,
    bool isRefreshed = false,
  }) async {
    if (!isRefreshed) {
      state = state.copyWith(movieListState: const AsyncValue.loading());
    }
    final result = _movieRepository.searchMovies(query: query);
    if (!mounted) return;
    result.then((data) {
      _movieList = data;
      state = state.copyWith(movieListState: AsyncData(_movieList.items));
    }).catchError((err, s) {
      state = state.copyWith(
        movieListState: AsyncError(err, s),
        errorAction: () {
          _searchMovies(query: query, isRefreshed: isRefreshed);
          state = state.copyWith(errorAction: null);
        },
      );
    });
  }

  void onSearchMovie(String searchQuery) {
    state = state.copyWith(
      movieListState:
          searchQuery.isEmpty ? AsyncLoading() : state.movieListState,
      searchQuery: searchQuery,
    );
    if (state.searchQuery.isEmpty || state.searchQuery.length > 2) {
      _searchDebounce?.cancel();
      _searchDebounce = Timer(
        const Duration(seconds: 1),
        () => searchQuery.isEmpty
            ? getPopularMovies()
            : _searchMovies(query: searchQuery),
      );
    }
  }

  void onRetried() {
    state.searchQuery.isEmpty
        ? getPopularMovies()
        : _searchMovies(query: lastQueryWhenError);
  }

  Future<void> onRefreshed() async {
    state = state.copyWith(forceRefresh: false);
    state.searchQuery.isEmpty
        ? await getPopularMovies(isRefreshed: true)
        : await _searchMovies(query: state.searchQuery, isRefreshed: true);
  }

  Future<void> _getNextPopularMovies() async {
    if (state.nextPageUiState is AsyncLoading || _movieList.nextPageKey < 2) {
      return;
    }
    state = state.copyWith(nextPageUiState: const AsyncLoading());

    final result = _movieRepository.getPopularMovies(
      page: _movieList.nextPageKey,
    );

    if (!mounted) return;
    result.then((data) {
      _movieList.updateItems(data);
      state = state.copyWith(
        movieListState: AsyncData(_movieList.items),
        nextPageUiState: AsyncData(null),
      );
    }).catchError((err, s) {
      state = state.copyWith(
        nextPageUiState: AsyncError(err, s),
        errorAction: _getNextPopularMovies,
      );
    });
  }

  Future<void> _searchNextPageMovies() async {
    if (state.nextPageUiState is AsyncLoading || _movieList.nextPageKey < 2) {
      return;
    }
    state = state.copyWith(nextPageUiState: const AsyncLoading());

    final result = _movieRepository.searchMovies(
      query: state.searchQuery,
      page: _movieList.nextPageKey,
    );

    if (!mounted) return;
    result.then((data) {
      _movieList.updateItems(data);
      state = state.copyWith(
        movieListState: AsyncData(_movieList.items),
        nextPageUiState: AsyncData(null),
      );
    }).catchError((err, s) {
      state = state.copyWith(
        nextPageUiState: AsyncError(err, s),
        errorAction: _getNextPopularMovies,
      );
    });
  }

  void onScrolledToBottom() {
    state.searchQuery.isEmpty
        ? _getNextPopularMovies()
        : _searchNextPageMovies();
  }

  void onItemClicked(int id) {
    var currentList = state.expandedMovies.toList();
    state.expandedMovies.contains(id)
        ? currentList.removeWhere((element) => element == id)
        : currentList.add(id);
    state = state.copyWith(expandedMovies: currentList);
  }

  void onSnackbarShown() {
    state = state.copyWith(nextPageUiState: AsyncData(null), errorAction: null);
  }
}

@freezed
class MovieListScreenUiState with _$MovieListScreenUiState {
  factory MovieListScreenUiState({
    @Default('') String searchQuery,
    @Default(false) bool forceRefresh,
    @Default(AsyncLoading()) AsyncValue<List<Movie>> movieListState,
    @Default(AsyncData(null)) AsyncValue<void> nextPageUiState,
    @Default(null) VoidCallback? errorAction,
    @Default([]) List<int> expandedMovies,
  }) = _MovieListScreenUiState;
}
