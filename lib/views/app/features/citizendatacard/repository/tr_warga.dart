import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:smapur/core/core.dart';
import 'package:smapur/models/tr_warga.dart';
import 'package:smapur/res/endpoints.dart';
import 'package:smapur/res/strings.dart';
import 'package:http/http.dart';

final wargaRepoProvider = Provider((ref) {
  final api = ref.watch(apiProvider);
  return WargaRepo(api: api);
});

class WargaRepo {
  final API _api;
  WargaRepo({required API api}) : _api = api;

  FutureEither<Warga> getWarga() async {
    final result =
        await _api.getRequest(url: Endpoints.apiHealthCheck, requireAuth: true);
    return result.fold((Failure failure) {
      log(failure.message, name: LogLabel.warga);
      return Left(failure);
    }, (Response response) {
      try {
        final data = jsonDecode(response.body);
        final wargaJson = data['result'];
        log(wargaJson.toString(), name: LogLabel.warga);
        final Warga warga = Warga.fromMap(wargaJson);
        return Right(warga);
      } catch (e, stktrc) {
        log(FailureMessage.jsonParsingFailed, name: LogLabel.warga);
        return Left(Failure(
            message: FailureMessage.jsonParsingFailed, stackTrace: stktrc));
      }
    });
  }
}
