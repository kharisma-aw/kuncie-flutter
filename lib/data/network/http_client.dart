import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'exceptions.dart';
import 'network_config.dart';

class HttpClient {
  HttpClient(this._config) {
    final options = BaseOptions(
      baseUrl: Uri(
        scheme: 'https',
        host: 'api.themoviedb.org',
      ).toString(),
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        Headers.acceptHeader: Headers.jsonContentType,
      },
    );
    _dio = Dio(options);
  }

  static final provider = Provider(
    (ref) {
      return HttpClient(ref.watch(NetworkConfig.provider));
    },
  );

  static const formUrlEncodedContentType = Headers.formUrlEncodedContentType;

  late final NetworkConfig _config;

  late final Dio _dio;

  Future<T> get<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    HttpResponseType responseType = HttpResponseType.json,
  }) async {
    final response = await _transformError(() async {
      return _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (headers != null) ...headers,
            HttpHeaders.authorizationHeader: 'Bearer ${_config.accessToken}',
          },
          responseType: responseType.toDioResponseType(),
        ),
      );
    });

    return response.data!;
  }

  Future<T> post<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
  }) async {
    final response = await _transformError(() async {
      return _dio.post<T>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (headers != null) ...headers,
            HttpHeaders.authorizationHeader: 'Bearer ${_config.accessToken}',
          },
          contentType: contentType,
          responseType: responseType.toDioResponseType(),
        ),
        data: body,
      );
    });

    return response.data!;
  }

  Future<Response<T>> _transformError<T>(
    Future<Response<T>> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();

      return response;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw ConnectionTimeoutException();
        case DioExceptionType.connectionError:
          throw NoConnectionException();
        case DioExceptionType.badResponse:
          throw HttpStatusCodeException(
            statusCode:
                e.response?.statusCode ?? HttpStatus.internalServerError,
            data: e.response?.data,
          );
        default:
          throw UnknownException(e.message);
      }
    }
  }
}

enum HttpResponseType {
  /// Transform the response data to JSON object only when the
  /// content-type of response is "application/json" .
  json,

  /// Get the response stream without any transformation. The
  /// Response data will be a `ResponseBody` instance.
  stream,

  /// Transform the response data to a String encoded with UTF8.
  plain,

  /// Get original bytes, the type of [Response.data] will be List<int>
  bytes
}

extension _DioHttpResonseTypeMapper on HttpResponseType {
  ResponseType toDioResponseType() {
    switch (this) {
      case HttpResponseType.json:
        return ResponseType.json;
      case HttpResponseType.stream:
        return ResponseType.json;
      case HttpResponseType.plain:
        return ResponseType.json;
      case HttpResponseType.bytes:
        return ResponseType.json;
    }
  }
}
