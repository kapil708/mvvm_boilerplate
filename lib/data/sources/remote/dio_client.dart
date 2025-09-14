import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/utils/exceptions.dart';
import '../../../core/utils/failures.dart';
import '../../../core/utils/network_info.dart';
import '../../../di/service_locator.dart';
import '../local/preferences_provider.dart';

Dio buildDioClient(String baseUrl) {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));
  dio
    ..options.baseUrl = baseUrl
    ..options.contentType = 'application/json'
    ..options.connectTimeout = Duration(seconds: 30)
    ..options.receiveTimeout = Duration(seconds: 30)
    ..options.sendTimeout = Duration(seconds: 30)
    ..options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

  dio.interceptors.clear();

  dio.interceptors.addAll(
    [
      /// ADD TOKEN TO HEADER
      TokenInterceptor(),

      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    ],
  );

  // //Debug.printLog("On buildDioClient -->> ${dio.options.headers}");

  return dio;
}

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? authToken = locator.get<PreferencesProvider>().getAuthToken();
    String? languageCode = locator.get<PreferencesProvider>().getLanguage();

    if (authToken != null && authToken.isNotEmpty) options.headers['Authorization'] = "Bearer $authToken";
    if (languageCode != null && languageCode.isNotEmpty) options.headers['locale'] = languageCode;
    super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    //Debug.printLog("OnResponse -->> ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    //Debug.printLog("onError -->> ${err.response?.data}");

    if (err.response?.statusCode == 401) {
      _handleUnauthorizedUser();
    }

    super.onError(err, handler);
  }

  void _handleUnauthorizedUser() {
    // AppCubit appCubit = locator.get<AppCubit>();
    // appCubit.logOut();
  }
}

Future<Either<RemoteFailure, T>> safeApiCall<T>({
  required Future<dynamic> Function() apiCall,
  required T Function(dynamic json) modelFromJson,
}) async {
  var networkInfo = locator.get<NetworkInfo>();

  if (await networkInfo.isConnected) {
    try {
      final result = await apiCall();
      var data = result is String ? jsonDecode(result) : result;

      return Right(modelFromJson(data));
    } on RemoteException catch (e) {
      return Left(RemoteFailure(statusCode: e.statusCode, message: e.message));
    } catch (e, st) {
      // logError(e: e.toString(), st: st, path: path);
      return Left(RemoteFailure(statusCode: e.runtimeType.hashCode, message: e.toString()));
    }
  } else {
    return Left(noInternetMsg());
  }
}

RemoteFailure noInternetMsg() {
  String? languageCode = locator.get<PreferencesProvider>().getLanguage();
  String message = languageCode == 'en' ? 'No internet connection.' : 'Keine Internetverbindung.';
  return RemoteFailure(statusCode: 12163, message: message);
}
