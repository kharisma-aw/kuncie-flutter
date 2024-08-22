import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_response_model.freezed.dart';
part 'config_response_model.g.dart';

@freezed
class ConfigResponse with _$ConfigResponse {
  const factory ConfigResponse({
    @JsonKey(name: 'images') ImageConfigResponse? images,
    @JsonKey(name: 'change_keys') List<String>? changeKeys,
  }) = _ConfigResponse;

  factory ConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigResponseFromJson(json);
}

@freezed
class ImageConfigResponse with _$ImageConfigResponse {
  const factory ImageConfigResponse({
    @JsonKey(name: 'base_url') String? baseUrl,
    @JsonKey(name: 'secure_base_url') String? secureBaseUrl,
    @JsonKey(name: 'backdrop_sizes') List<String>? backdropSizes,
    @JsonKey(name: 'logo_sizes') List<String>? logoSizes,
    @JsonKey(name: 'poster_sizes') List<String>? posterSizes,
    @JsonKey(name: 'profile_sizes') List<String>? profileSizes,
    @JsonKey(name: 'still_sizes') List<String>? stillSizes,
  }) = _ImageConfigResponse;

  factory ImageConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageConfigResponseFromJson(json);
}
