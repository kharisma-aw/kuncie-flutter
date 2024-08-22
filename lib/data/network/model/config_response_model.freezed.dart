// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) {
  return _ConfigResponse.fromJson(json);
}

/// @nodoc
mixin _$ConfigResponse {
  @JsonKey(name: 'images')
  ImageConfigResponse? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'change_keys')
  List<String>? get changeKeys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigResponseCopyWith<ConfigResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigResponseCopyWith<$Res> {
  factory $ConfigResponseCopyWith(
          ConfigResponse value, $Res Function(ConfigResponse) then) =
      _$ConfigResponseCopyWithImpl<$Res, ConfigResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'images') ImageConfigResponse? images,
      @JsonKey(name: 'change_keys') List<String>? changeKeys});

  $ImageConfigResponseCopyWith<$Res>? get images;
}

/// @nodoc
class _$ConfigResponseCopyWithImpl<$Res, $Val extends ConfigResponse>
    implements $ConfigResponseCopyWith<$Res> {
  _$ConfigResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? changeKeys = freezed,
  }) {
    return _then(_value.copyWith(
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImageConfigResponse?,
      changeKeys: freezed == changeKeys
          ? _value.changeKeys
          : changeKeys // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageConfigResponseCopyWith<$Res>? get images {
    if (_value.images == null) {
      return null;
    }

    return $ImageConfigResponseCopyWith<$Res>(_value.images!, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfigResponseImplCopyWith<$Res>
    implements $ConfigResponseCopyWith<$Res> {
  factory _$$ConfigResponseImplCopyWith(_$ConfigResponseImpl value,
          $Res Function(_$ConfigResponseImpl) then) =
      __$$ConfigResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'images') ImageConfigResponse? images,
      @JsonKey(name: 'change_keys') List<String>? changeKeys});

  @override
  $ImageConfigResponseCopyWith<$Res>? get images;
}

/// @nodoc
class __$$ConfigResponseImplCopyWithImpl<$Res>
    extends _$ConfigResponseCopyWithImpl<$Res, _$ConfigResponseImpl>
    implements _$$ConfigResponseImplCopyWith<$Res> {
  __$$ConfigResponseImplCopyWithImpl(
      _$ConfigResponseImpl _value, $Res Function(_$ConfigResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? changeKeys = freezed,
  }) {
    return _then(_$ConfigResponseImpl(
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImageConfigResponse?,
      changeKeys: freezed == changeKeys
          ? _value._changeKeys
          : changeKeys // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigResponseImpl implements _ConfigResponse {
  const _$ConfigResponseImpl(
      {@JsonKey(name: 'images') this.images,
      @JsonKey(name: 'change_keys') final List<String>? changeKeys})
      : _changeKeys = changeKeys;

  factory _$ConfigResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigResponseImplFromJson(json);

  @override
  @JsonKey(name: 'images')
  final ImageConfigResponse? images;
  final List<String>? _changeKeys;
  @override
  @JsonKey(name: 'change_keys')
  List<String>? get changeKeys {
    final value = _changeKeys;
    if (value == null) return null;
    if (_changeKeys is EqualUnmodifiableListView) return _changeKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ConfigResponse(images: $images, changeKeys: $changeKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigResponseImpl &&
            (identical(other.images, images) || other.images == images) &&
            const DeepCollectionEquality()
                .equals(other._changeKeys, _changeKeys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, images, const DeepCollectionEquality().hash(_changeKeys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigResponseImplCopyWith<_$ConfigResponseImpl> get copyWith =>
      __$$ConfigResponseImplCopyWithImpl<_$ConfigResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigResponseImplToJson(
      this,
    );
  }
}

abstract class _ConfigResponse implements ConfigResponse {
  const factory _ConfigResponse(
          {@JsonKey(name: 'images') final ImageConfigResponse? images,
          @JsonKey(name: 'change_keys') final List<String>? changeKeys}) =
      _$ConfigResponseImpl;

  factory _ConfigResponse.fromJson(Map<String, dynamic> json) =
      _$ConfigResponseImpl.fromJson;

  @override
  @JsonKey(name: 'images')
  ImageConfigResponse? get images;
  @override
  @JsonKey(name: 'change_keys')
  List<String>? get changeKeys;
  @override
  @JsonKey(ignore: true)
  _$$ConfigResponseImplCopyWith<_$ConfigResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageConfigResponse _$ImageConfigResponseFromJson(Map<String, dynamic> json) {
  return _ImageConfigResponse.fromJson(json);
}

/// @nodoc
mixin _$ImageConfigResponse {
  @JsonKey(name: 'base_url')
  String? get baseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'secure_base_url')
  String? get secureBaseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_sizes')
  List<String>? get backdropSizes => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_sizes')
  List<String>? get logoSizes => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_sizes')
  List<String>? get posterSizes => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_sizes')
  List<String>? get profileSizes => throw _privateConstructorUsedError;
  @JsonKey(name: 'still_sizes')
  List<String>? get stillSizes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageConfigResponseCopyWith<ImageConfigResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageConfigResponseCopyWith<$Res> {
  factory $ImageConfigResponseCopyWith(
          ImageConfigResponse value, $Res Function(ImageConfigResponse) then) =
      _$ImageConfigResponseCopyWithImpl<$Res, ImageConfigResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'base_url') String? baseUrl,
      @JsonKey(name: 'secure_base_url') String? secureBaseUrl,
      @JsonKey(name: 'backdrop_sizes') List<String>? backdropSizes,
      @JsonKey(name: 'logo_sizes') List<String>? logoSizes,
      @JsonKey(name: 'poster_sizes') List<String>? posterSizes,
      @JsonKey(name: 'profile_sizes') List<String>? profileSizes,
      @JsonKey(name: 'still_sizes') List<String>? stillSizes});
}

/// @nodoc
class _$ImageConfigResponseCopyWithImpl<$Res, $Val extends ImageConfigResponse>
    implements $ImageConfigResponseCopyWith<$Res> {
  _$ImageConfigResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = freezed,
    Object? secureBaseUrl = freezed,
    Object? backdropSizes = freezed,
    Object? logoSizes = freezed,
    Object? posterSizes = freezed,
    Object? profileSizes = freezed,
    Object? stillSizes = freezed,
  }) {
    return _then(_value.copyWith(
      baseUrl: freezed == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      secureBaseUrl: freezed == secureBaseUrl
          ? _value.secureBaseUrl
          : secureBaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropSizes: freezed == backdropSizes
          ? _value.backdropSizes
          : backdropSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      logoSizes: freezed == logoSizes
          ? _value.logoSizes
          : logoSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      posterSizes: freezed == posterSizes
          ? _value.posterSizes
          : posterSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profileSizes: freezed == profileSizes
          ? _value.profileSizes
          : profileSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stillSizes: freezed == stillSizes
          ? _value.stillSizes
          : stillSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageConfigResponseImplCopyWith<$Res>
    implements $ImageConfigResponseCopyWith<$Res> {
  factory _$$ImageConfigResponseImplCopyWith(_$ImageConfigResponseImpl value,
          $Res Function(_$ImageConfigResponseImpl) then) =
      __$$ImageConfigResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'base_url') String? baseUrl,
      @JsonKey(name: 'secure_base_url') String? secureBaseUrl,
      @JsonKey(name: 'backdrop_sizes') List<String>? backdropSizes,
      @JsonKey(name: 'logo_sizes') List<String>? logoSizes,
      @JsonKey(name: 'poster_sizes') List<String>? posterSizes,
      @JsonKey(name: 'profile_sizes') List<String>? profileSizes,
      @JsonKey(name: 'still_sizes') List<String>? stillSizes});
}

/// @nodoc
class __$$ImageConfigResponseImplCopyWithImpl<$Res>
    extends _$ImageConfigResponseCopyWithImpl<$Res, _$ImageConfigResponseImpl>
    implements _$$ImageConfigResponseImplCopyWith<$Res> {
  __$$ImageConfigResponseImplCopyWithImpl(_$ImageConfigResponseImpl _value,
      $Res Function(_$ImageConfigResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = freezed,
    Object? secureBaseUrl = freezed,
    Object? backdropSizes = freezed,
    Object? logoSizes = freezed,
    Object? posterSizes = freezed,
    Object? profileSizes = freezed,
    Object? stillSizes = freezed,
  }) {
    return _then(_$ImageConfigResponseImpl(
      baseUrl: freezed == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      secureBaseUrl: freezed == secureBaseUrl
          ? _value.secureBaseUrl
          : secureBaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropSizes: freezed == backdropSizes
          ? _value._backdropSizes
          : backdropSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      logoSizes: freezed == logoSizes
          ? _value._logoSizes
          : logoSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      posterSizes: freezed == posterSizes
          ? _value._posterSizes
          : posterSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profileSizes: freezed == profileSizes
          ? _value._profileSizes
          : profileSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stillSizes: freezed == stillSizes
          ? _value._stillSizes
          : stillSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageConfigResponseImpl implements _ImageConfigResponse {
  const _$ImageConfigResponseImpl(
      {@JsonKey(name: 'base_url') this.baseUrl,
      @JsonKey(name: 'secure_base_url') this.secureBaseUrl,
      @JsonKey(name: 'backdrop_sizes') final List<String>? backdropSizes,
      @JsonKey(name: 'logo_sizes') final List<String>? logoSizes,
      @JsonKey(name: 'poster_sizes') final List<String>? posterSizes,
      @JsonKey(name: 'profile_sizes') final List<String>? profileSizes,
      @JsonKey(name: 'still_sizes') final List<String>? stillSizes})
      : _backdropSizes = backdropSizes,
        _logoSizes = logoSizes,
        _posterSizes = posterSizes,
        _profileSizes = profileSizes,
        _stillSizes = stillSizes;

  factory _$ImageConfigResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageConfigResponseImplFromJson(json);

  @override
  @JsonKey(name: 'base_url')
  final String? baseUrl;
  @override
  @JsonKey(name: 'secure_base_url')
  final String? secureBaseUrl;
  final List<String>? _backdropSizes;
  @override
  @JsonKey(name: 'backdrop_sizes')
  List<String>? get backdropSizes {
    final value = _backdropSizes;
    if (value == null) return null;
    if (_backdropSizes is EqualUnmodifiableListView) return _backdropSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _logoSizes;
  @override
  @JsonKey(name: 'logo_sizes')
  List<String>? get logoSizes {
    final value = _logoSizes;
    if (value == null) return null;
    if (_logoSizes is EqualUnmodifiableListView) return _logoSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _posterSizes;
  @override
  @JsonKey(name: 'poster_sizes')
  List<String>? get posterSizes {
    final value = _posterSizes;
    if (value == null) return null;
    if (_posterSizes is EqualUnmodifiableListView) return _posterSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _profileSizes;
  @override
  @JsonKey(name: 'profile_sizes')
  List<String>? get profileSizes {
    final value = _profileSizes;
    if (value == null) return null;
    if (_profileSizes is EqualUnmodifiableListView) return _profileSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _stillSizes;
  @override
  @JsonKey(name: 'still_sizes')
  List<String>? get stillSizes {
    final value = _stillSizes;
    if (value == null) return null;
    if (_stillSizes is EqualUnmodifiableListView) return _stillSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ImageConfigResponse(baseUrl: $baseUrl, secureBaseUrl: $secureBaseUrl, backdropSizes: $backdropSizes, logoSizes: $logoSizes, posterSizes: $posterSizes, profileSizes: $profileSizes, stillSizes: $stillSizes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageConfigResponseImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.secureBaseUrl, secureBaseUrl) ||
                other.secureBaseUrl == secureBaseUrl) &&
            const DeepCollectionEquality()
                .equals(other._backdropSizes, _backdropSizes) &&
            const DeepCollectionEquality()
                .equals(other._logoSizes, _logoSizes) &&
            const DeepCollectionEquality()
                .equals(other._posterSizes, _posterSizes) &&
            const DeepCollectionEquality()
                .equals(other._profileSizes, _profileSizes) &&
            const DeepCollectionEquality()
                .equals(other._stillSizes, _stillSizes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      baseUrl,
      secureBaseUrl,
      const DeepCollectionEquality().hash(_backdropSizes),
      const DeepCollectionEquality().hash(_logoSizes),
      const DeepCollectionEquality().hash(_posterSizes),
      const DeepCollectionEquality().hash(_profileSizes),
      const DeepCollectionEquality().hash(_stillSizes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageConfigResponseImplCopyWith<_$ImageConfigResponseImpl> get copyWith =>
      __$$ImageConfigResponseImplCopyWithImpl<_$ImageConfigResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageConfigResponseImplToJson(
      this,
    );
  }
}

abstract class _ImageConfigResponse implements ImageConfigResponse {
  const factory _ImageConfigResponse(
          {@JsonKey(name: 'base_url') final String? baseUrl,
          @JsonKey(name: 'secure_base_url') final String? secureBaseUrl,
          @JsonKey(name: 'backdrop_sizes') final List<String>? backdropSizes,
          @JsonKey(name: 'logo_sizes') final List<String>? logoSizes,
          @JsonKey(name: 'poster_sizes') final List<String>? posterSizes,
          @JsonKey(name: 'profile_sizes') final List<String>? profileSizes,
          @JsonKey(name: 'still_sizes') final List<String>? stillSizes}) =
      _$ImageConfigResponseImpl;

  factory _ImageConfigResponse.fromJson(Map<String, dynamic> json) =
      _$ImageConfigResponseImpl.fromJson;

  @override
  @JsonKey(name: 'base_url')
  String? get baseUrl;
  @override
  @JsonKey(name: 'secure_base_url')
  String? get secureBaseUrl;
  @override
  @JsonKey(name: 'backdrop_sizes')
  List<String>? get backdropSizes;
  @override
  @JsonKey(name: 'logo_sizes')
  List<String>? get logoSizes;
  @override
  @JsonKey(name: 'poster_sizes')
  List<String>? get posterSizes;
  @override
  @JsonKey(name: 'profile_sizes')
  List<String>? get profileSizes;
  @override
  @JsonKey(name: 'still_sizes')
  List<String>? get stillSizes;
  @override
  @JsonKey(ignore: true)
  _$$ImageConfigResponseImplCopyWith<_$ImageConfigResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
