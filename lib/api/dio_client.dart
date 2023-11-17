import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ocean_hack/api/exeption/network_exceptions.dart';
import 'package:ocean_hack/model/user.dart';
import 'package:ocean_hack/utils/local_storage/constant.dart';
import 'package:ocean_hack/utils/local_storage/local_storage.dart';

class DioClient {
  String baseUrl;
  final String port;

  final Dio _dio = Dio();

  final List<Interceptor>? interceptors;

  DioClient({
    this.baseUrl = 'http://10.0.2.2',
    this.port = '5000',
    this.interceptors,
  }) {
    if (Platform.isIOS) {
      baseUrl = 'http://0.0.0.0';
    }
    _dio
      ..options.baseUrl = '$baseUrl:$port'
      ..httpClientAdapter
      ..options.connectTimeout = const Duration(milliseconds: 5000)
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException catch (e) {
      return errorHandle(e);
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    bool needAuthorization = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    String? localStorageUser =
        await getItemFromLocalStorage(LocalStorageKey.authUser);

    Map<String, dynamic> dataWithToken = {...data ?? {}};
    if (localStorageUser != null) {
      AuthUser currentUser = AuthUser.fromJson(json.decode(localStorageUser));
      dataWithToken['token'] = currentUser.token;
    }

    try {
      var response = await _dio.post(
        uri,
        data: dataWithToken,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.data is String &&
          response.data.startsWith('[') &&
          response.data.endsWith(']')) {
        return jsonDecode(response.data);
      }

      return response.data;
    } on DioException catch (e) {
      return errorHandle(e);
    }
  }

  Map<String, dynamic> errorHandle(DioException error) {
    Map<String, dynamic> data = {};

    ErrorType errorType = NetworkExceptions.getDioException(error);
    String message = NetworkExceptions.getErrorMessage(errorType);

    return {
      "code": error.response?.statusCode,
      "success": false,
      "message": message,
      "data": data,
    };
  }
}
