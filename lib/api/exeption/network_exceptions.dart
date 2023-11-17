import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ocean_hack/logger/log_printer.dart';

enum ErrorType {
  requestCancelled,
  unauthorisedRequest,
  badRequest,
  notFound,
  requestTimeout,
  sendTimeout,
  conflict,
  internalServerError,
  receiveTimeout,
  serviceUnavailable,
  noInternetConnection,
  defaultError,
  unexpectedError,
  formatException,
  unableToProcess,
}

final _logger = getLogger('EhpRouter');

class NetworkExceptions {
  static ErrorType getDioException(error) {
    _logger.e(error);
    if (error is Exception) {
      try {
        ErrorType networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = ErrorType.requestCancelled;
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = ErrorType.requestTimeout;
              break;
            case DioExceptionType.connectionError:
              networkExceptions = ErrorType.noInternetConnection;
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = ErrorType.receiveTimeout;
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = ErrorType.sendTimeout;
              break;
            default:
              switch (error.response!.statusCode) {
                case 400:
                  networkExceptions = ErrorType.badRequest;
                  break;
                case 401:
                  networkExceptions = ErrorType.unauthorisedRequest;
                  break;
                case 403:
                  networkExceptions = ErrorType.unauthorisedRequest;
                  break;
                case 404:
                  networkExceptions = ErrorType.notFound;
                  break;
                case 409:
                  networkExceptions = ErrorType.conflict;
                  break;
                case 408:
                  networkExceptions = ErrorType.requestTimeout;
                  break;
                case 500:
                  networkExceptions = ErrorType.internalServerError;
                  break;
                case 503:
                  networkExceptions = ErrorType.serviceUnavailable;
                  break;
                default:
                  networkExceptions = ErrorType.defaultError;
              }
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = ErrorType.noInternetConnection;
        } else {
          networkExceptions = ErrorType.unexpectedError;
        }
        return networkExceptions;
      } on FormatException catch (_) {
        // Helper.printError(e.toString);
        return ErrorType.formatException;
      } catch (_) {
        return ErrorType.unexpectedError;
      }
    } else {
      return ErrorType.unexpectedError;
    }
  }

  static String getErrorMessage(ErrorType networkExceptions) {
    var errorMessage = "";

    switch (networkExceptions) {
      case ErrorType.requestCancelled:
        errorMessage = "Request Cancelled";
        break;
      case ErrorType.badRequest:
        errorMessage = "Bad request";
        break;
      case ErrorType.unauthorisedRequest:
        errorMessage = "Unauthorised request";
        break;
      case ErrorType.notFound:
        errorMessage = "Not found";
        break;
      case ErrorType.requestTimeout:
        errorMessage = "Request timeout";
        break;
      case ErrorType.sendTimeout:
        errorMessage = "Send timeout";
        break;
      case ErrorType.receiveTimeout:
        errorMessage = "Receive timeout";
        break;
      case ErrorType.conflict:
        errorMessage = "Error due to a conflict";
        break;
      case ErrorType.internalServerError:
        errorMessage = "Internal server error";
        break;
      case ErrorType.serviceUnavailable:
        errorMessage = "Service unavailable";
        break;
      case ErrorType.noInternetConnection:
        errorMessage = "No internet connection";
        break;
      case ErrorType.defaultError:
        errorMessage = "Unexpected error occurred";
        break;
      case ErrorType.unexpectedError:
        errorMessage = "Unexpected error occurred";
        break;
      case ErrorType.formatException:
        errorMessage = "Unexpected error occurred";
        break;
      case ErrorType.unableToProcess:
        errorMessage = "Unable to process the data";
        break;
    }
    return errorMessage;
  }
}
