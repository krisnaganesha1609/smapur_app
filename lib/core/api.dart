import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smapur/common/provider/common_providers.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:smapur/res/strings.dart';
import 'package:smapur/utils/config.dart';

import 'core.dart';

final apiProvider = StateProvider((ref) {
  final authSession = ref.watch(authSessionProvider);
  return API(authSession: authSession);
});

class API {
  final String? _authSession;

  API({required String? authSession}) : _authSession = authSession;

  FutureEither<Response> getRequest(
      {required String url, required bool requireAuth}) async {
    final Map<String, String> requestHeader = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authSession"
    };

    if (requireAuth) {
      if ((_authSession ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpGet);
      log('requireAuth : $requireAuth', name: LogLabel.httpGet);
    }

    try {
      final response = await get(Uri.parse(url), headers: requestHeader);
      log('RESPONSE : ${response.body}', name: LogLabel.httpGet);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.getRequestMessage, stackTrace: stktrc));
    }
  }

  FutureEither<Response> postRequest(
      {required String url, dynamic body, required bool requireAuth}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authSession"
    };
    if (requireAuth) {
      if ((_authSession ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPost);
      log('requireAuth : $requireAuth', name: LogLabel.httpPost);
      log('BODY : $body', name: LogLabel.httpPost);
    }
    try {
      final response = await post(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpPost);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.postRequestMessage, stackTrace: stktrc));
    }
  }

  FutureEither<Response> putRequest(
      {required String url, dynamic body, required bool requireAuth}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authSession"
    };
    if (requireAuth) {
      if ((_authSession ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPut);
      log(
        'requireAuth : $requireAuth',
        name: LogLabel.httpPut,
      );
      log('BODY : $body', name: LogLabel.httpPut);
    }
    try {
      final response = await put(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpPut);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.putRequestMessage, stackTrace: stktrc));
    }
  }

  FutureEither<Response> deleteRequest(
      {required String url, dynamic body, required bool requireAuth}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authSession"
    };
    if (requireAuth) {
      if ((_authSession ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpDelete);
      log('requireAuth : $requireAuth', name: LogLabel.httpDelete);
      log('BODY : $body', name: LogLabel.httpDelete);
    }
    try {
      final response = await put(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpDelete);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.deleteRequestMessage, stackTrace: stktrc));
    }
  }
}
