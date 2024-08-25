// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieListScreenUiState {
  String get searchQuery => throw _privateConstructorUsedError;
  bool get forceRefresh => throw _privateConstructorUsedError;
  AsyncValue<List<Movie>> get movieListState =>
      throw _privateConstructorUsedError;
  AsyncValue<void> get nextPageUiState => throw _privateConstructorUsedError;
  VoidCallback? get errorAction => throw _privateConstructorUsedError;
  List<int> get expandedMovies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieListScreenUiStateCopyWith<MovieListScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListScreenUiStateCopyWith<$Res> {
  factory $MovieListScreenUiStateCopyWith(MovieListScreenUiState value,
          $Res Function(MovieListScreenUiState) then) =
      _$MovieListScreenUiStateCopyWithImpl<$Res, MovieListScreenUiState>;
  @useResult
  $Res call(
      {String searchQuery,
      bool forceRefresh,
      AsyncValue<List<Movie>> movieListState,
      AsyncValue<void> nextPageUiState,
      VoidCallback? errorAction,
      List<int> expandedMovies});
}

/// @nodoc
class _$MovieListScreenUiStateCopyWithImpl<$Res,
        $Val extends MovieListScreenUiState>
    implements $MovieListScreenUiStateCopyWith<$Res> {
  _$MovieListScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? forceRefresh = null,
    Object? movieListState = null,
    Object? nextPageUiState = null,
    Object? errorAction = freezed,
    Object? expandedMovies = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      forceRefresh: null == forceRefresh
          ? _value.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      movieListState: null == movieListState
          ? _value.movieListState
          : movieListState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Movie>>,
      nextPageUiState: null == nextPageUiState
          ? _value.nextPageUiState
          : nextPageUiState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      errorAction: freezed == errorAction
          ? _value.errorAction
          : errorAction // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      expandedMovies: null == expandedMovies
          ? _value.expandedMovies
          : expandedMovies // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieListScreenUiStateImplCopyWith<$Res>
    implements $MovieListScreenUiStateCopyWith<$Res> {
  factory _$$MovieListScreenUiStateImplCopyWith(
          _$MovieListScreenUiStateImpl value,
          $Res Function(_$MovieListScreenUiStateImpl) then) =
      __$$MovieListScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      bool forceRefresh,
      AsyncValue<List<Movie>> movieListState,
      AsyncValue<void> nextPageUiState,
      VoidCallback? errorAction,
      List<int> expandedMovies});
}

/// @nodoc
class __$$MovieListScreenUiStateImplCopyWithImpl<$Res>
    extends _$MovieListScreenUiStateCopyWithImpl<$Res,
        _$MovieListScreenUiStateImpl>
    implements _$$MovieListScreenUiStateImplCopyWith<$Res> {
  __$$MovieListScreenUiStateImplCopyWithImpl(
      _$MovieListScreenUiStateImpl _value,
      $Res Function(_$MovieListScreenUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? forceRefresh = null,
    Object? movieListState = null,
    Object? nextPageUiState = null,
    Object? errorAction = freezed,
    Object? expandedMovies = null,
  }) {
    return _then(_$MovieListScreenUiStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      forceRefresh: null == forceRefresh
          ? _value.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      movieListState: null == movieListState
          ? _value.movieListState
          : movieListState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Movie>>,
      nextPageUiState: null == nextPageUiState
          ? _value.nextPageUiState
          : nextPageUiState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      errorAction: freezed == errorAction
          ? _value.errorAction
          : errorAction // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      expandedMovies: null == expandedMovies
          ? _value._expandedMovies
          : expandedMovies // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$MovieListScreenUiStateImpl implements _MovieListScreenUiState {
  _$MovieListScreenUiStateImpl(
      {this.searchQuery = '',
      this.forceRefresh = false,
      this.movieListState = const AsyncLoading(),
      this.nextPageUiState = const AsyncData(null),
      this.errorAction = null,
      final List<int> expandedMovies = const []})
      : _expandedMovies = expandedMovies;

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final bool forceRefresh;
  @override
  @JsonKey()
  final AsyncValue<List<Movie>> movieListState;
  @override
  @JsonKey()
  final AsyncValue<void> nextPageUiState;
  @override
  @JsonKey()
  final VoidCallback? errorAction;
  final List<int> _expandedMovies;
  @override
  @JsonKey()
  List<int> get expandedMovies {
    if (_expandedMovies is EqualUnmodifiableListView) return _expandedMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expandedMovies);
  }

  @override
  String toString() {
    return 'MovieListScreenUiState(searchQuery: $searchQuery, forceRefresh: $forceRefresh, movieListState: $movieListState, nextPageUiState: $nextPageUiState, errorAction: $errorAction, expandedMovies: $expandedMovies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListScreenUiStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh) &&
            (identical(other.movieListState, movieListState) ||
                other.movieListState == movieListState) &&
            (identical(other.nextPageUiState, nextPageUiState) ||
                other.nextPageUiState == nextPageUiState) &&
            (identical(other.errorAction, errorAction) ||
                other.errorAction == errorAction) &&
            const DeepCollectionEquality()
                .equals(other._expandedMovies, _expandedMovies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchQuery,
      forceRefresh,
      movieListState,
      nextPageUiState,
      errorAction,
      const DeepCollectionEquality().hash(_expandedMovies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListScreenUiStateImplCopyWith<_$MovieListScreenUiStateImpl>
      get copyWith => __$$MovieListScreenUiStateImplCopyWithImpl<
          _$MovieListScreenUiStateImpl>(this, _$identity);
}

abstract class _MovieListScreenUiState implements MovieListScreenUiState {
  factory _MovieListScreenUiState(
      {final String searchQuery,
      final bool forceRefresh,
      final AsyncValue<List<Movie>> movieListState,
      final AsyncValue<void> nextPageUiState,
      final VoidCallback? errorAction,
      final List<int> expandedMovies}) = _$MovieListScreenUiStateImpl;

  @override
  String get searchQuery;
  @override
  bool get forceRefresh;
  @override
  AsyncValue<List<Movie>> get movieListState;
  @override
  AsyncValue<void> get nextPageUiState;
  @override
  VoidCallback? get errorAction;
  @override
  List<int> get expandedMovies;
  @override
  @JsonKey(ignore: true)
  _$$MovieListScreenUiStateImplCopyWith<_$MovieListScreenUiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
