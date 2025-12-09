import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_boilerplate/core/network/failures.dart';
import 'package:mvvm_boilerplate/core/utils/network_info.dart';

/// Base repository class with common API call patterns
abstract class BaseRepository {
  /// Safe API call wrapper with network check and error handling
  Future<Either<RemoteFailure, T>> safeApiCall<T>({
    required Future<dynamic> Function() apiCall,
    required T Function(dynamic json) modelFromJson,
  }) async {
    if (await hasInternetConnection()) {
      try {
        final result = await apiCall();
        var data = result is String ? jsonDecode(result) : result;
        return Right(modelFromJson(data));
      } on DioException catch (dioError, stackTrace) {
        log('DioException: ${dioError.message}', error: dioError, stackTrace: stackTrace);

        // Handle status codes
        int statusCode = dioError.response?.statusCode ?? 500;
        String errorMessage = _getErrorMessageFromStatusCode(statusCode);

        // Try to extract error message from response
        if (dioError.response?.data != null) {
          try {
            final responseData = dioError.response!.data;
            if (responseData is Map<String, dynamic>) {
              errorMessage = responseData['message'] ?? responseData['error'] ?? responseData['detail'] ?? errorMessage;
            } else if (responseData is String) {
              errorMessage = responseData;
            }
          } catch (e) {
            // Keep the default error message
          }
        }

        return Left(RemoteFailure(
          statusCode: statusCode,
          message: errorMessage,
        ));
      } catch (e, stackTrace) {
        log('API call failed: $e', error: e, stackTrace: stackTrace);
        return Left(RemoteFailure(
          statusCode: e.runtimeType.hashCode,
          message: e.toString(),
        ));
      }
    } else {
      return Left(RemoteFailure(
        statusCode: 12163,
        message: 'No internet connection',
      ));
    }
  }

  /// Safe API call for list responses
  Future<Either<RemoteFailure, List<T>>> safeApiCallList<T>({
    required Future<dynamic> Function() apiCall,
    required T Function(Map<String, dynamic> json) modelFromJson,
    String? listKey,
  }) async {
    return safeApiCall<List<T>>(
      apiCall: apiCall,
      modelFromJson: (json) {
        if (listKey != null && json is Map<String, dynamic>) {
          final list = json[listKey] as List;
          return list.map((item) => modelFromJson(item as Map<String, dynamic>)).toList();
        } else if (json is List) {
          return json.map((item) => modelFromJson(item as Map<String, dynamic>)).toList();
        }
        throw Exception('Invalid response format');
      },
    );
  }

  /// Handle common HTTP errors
  RemoteFailure handleHttpError(dynamic error) {
    if (error.toString().contains('SocketException')) {
      return RemoteFailure(statusCode: 12163, message: 'No internet connection');
    } else if (error.toString().contains('TimeoutException')) {
      return RemoteFailure(statusCode: 408, message: 'Request timeout');
    } else {
      return RemoteFailure(
        statusCode: 500,
        message: 'An unexpected error occurred',
      );
    }
  }

  /// Get user-friendly error message based on HTTP status code
  String _getErrorMessageFromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad Request - Please check your input';
      case 401:
        return 'Unauthorized - Please check your credentials';
      case 403:
        return 'Forbidden - You don\'t have permission';
      case 404:
        return 'Not Found - Resource not available';
      case 405:
        return 'Method Not Allowed';
      case 408:
        return 'Request Timeout - Please try again';
      case 409:
        return 'Conflict - Resource already exists';
      case 422:
        return 'Unprocessable Entity - Invalid data format';
      case 429:
        return 'Too Many Requests - Please try again later';
      case 500:
        return 'Internal Server Error - Please try again later';
      case 502:
        return 'Bad Gateway - Server is temporarily unavailable';
      case 503:
        return 'Service Unavailable - Please try again later';
      case 504:
        return 'Gateway Timeout - Please try again';
      default:
        return 'Request failed with status code $statusCode';
    }
  }
}
