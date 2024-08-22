// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenresResponse _$GenresResponseFromJson(Map<String, dynamic> json) {
  return _GenresResponse.fromJson(json);
}

/// @nodoc
mixin _$GenresResponse {
  @JsonKey(name: 'genres')
  List<GenreResponse>? get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenresResponseCopyWith<GenresResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenresResponseCopyWith<$Res> {
  factory $GenresResponseCopyWith(
          GenresResponse value, $Res Function(GenresResponse) then) =
      _$GenresResponseCopyWithImpl<$Res, GenresResponse>;
  @useResult
  $Res call({@JsonKey(name: 'genres') List<GenreResponse>? genres});
}

/// @nodoc
class _$GenresResponseCopyWithImpl<$Res, $Val extends GenresResponse>
    implements $GenresResponseCopyWith<$Res> {
  _$GenresResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = freezed,
  }) {
    return _then(_value.copyWith(
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenresResponseImplCopyWith<$Res>
    implements $GenresResponseCopyWith<$Res> {
  factory _$$GenresResponseImplCopyWith(_$GenresResponseImpl value,
          $Res Function(_$GenresResponseImpl) then) =
      __$$GenresResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'genres') List<GenreResponse>? genres});
}

/// @nodoc
class __$$GenresResponseImplCopyWithImpl<$Res>
    extends _$GenresResponseCopyWithImpl<$Res, _$GenresResponseImpl>
    implements _$$GenresResponseImplCopyWith<$Res> {
  __$$GenresResponseImplCopyWithImpl(
      _$GenresResponseImpl _value, $Res Function(_$GenresResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = freezed,
  }) {
    return _then(_$GenresResponseImpl(
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenresResponseImpl implements _GenresResponse {
  const _$GenresResponseImpl(
      {@JsonKey(name: 'genres') final List<GenreResponse>? genres})
      : _genres = genres;

  factory _$GenresResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenresResponseImplFromJson(json);

  final List<GenreResponse>? _genres;
  @override
  @JsonKey(name: 'genres')
  List<GenreResponse>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GenresResponse(genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenresResponseImpl &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenresResponseImplCopyWith<_$GenresResponseImpl> get copyWith =>
      __$$GenresResponseImplCopyWithImpl<_$GenresResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenresResponseImplToJson(
      this,
    );
  }
}

abstract class _GenresResponse implements GenresResponse {
  const factory _GenresResponse(
          {@JsonKey(name: 'genres') final List<GenreResponse>? genres}) =
      _$GenresResponseImpl;

  factory _GenresResponse.fromJson(Map<String, dynamic> json) =
      _$GenresResponseImpl.fromJson;

  @override
  @JsonKey(name: 'genres')
  List<GenreResponse>? get genres;
  @override
  @JsonKey(ignore: true)
  _$$GenresResponseImplCopyWith<_$GenresResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenreResponse _$GenreResponseFromJson(Map<String, dynamic> json) {
  return _GenreResponse.fromJson(json);
}

/// @nodoc
mixin _$GenreResponse {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreResponseCopyWith<GenreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreResponseCopyWith<$Res> {
  factory $GenreResponseCopyWith(
          GenreResponse value, $Res Function(GenreResponse) then) =
      _$GenreResponseCopyWithImpl<$Res, GenreResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$GenreResponseCopyWithImpl<$Res, $Val extends GenreResponse>
    implements $GenreResponseCopyWith<$Res> {
  _$GenreResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenreResponseImplCopyWith<$Res>
    implements $GenreResponseCopyWith<$Res> {
  factory _$$GenreResponseImplCopyWith(
          _$GenreResponseImpl value, $Res Function(_$GenreResponseImpl) then) =
      __$$GenreResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$$GenreResponseImplCopyWithImpl<$Res>
    extends _$GenreResponseCopyWithImpl<$Res, _$GenreResponseImpl>
    implements _$$GenreResponseImplCopyWith<$Res> {
  __$$GenreResponseImplCopyWithImpl(
      _$GenreResponseImpl _value, $Res Function(_$GenreResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$GenreResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreResponseImpl implements _GenreResponse {
  const _$GenreResponseImpl(
      {@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name});

  factory _$GenreResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'GenreResponse(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreResponseImplCopyWith<_$GenreResponseImpl> get copyWith =>
      __$$GenreResponseImplCopyWithImpl<_$GenreResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreResponseImplToJson(
      this,
    );
  }
}

abstract class _GenreResponse implements GenreResponse {
  const factory _GenreResponse(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name}) = _$GenreResponseImpl;

  factory _GenreResponse.fromJson(Map<String, dynamic> json) =
      _$GenreResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$GenreResponseImplCopyWith<_$GenreResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
