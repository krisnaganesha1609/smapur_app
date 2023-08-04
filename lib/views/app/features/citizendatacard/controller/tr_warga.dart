import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smapur/models/tr_warga.dart';
import 'package:smapur/res/strings.dart';
import 'package:smapur/utils/config.dart';
import 'package:smapur/utils/snackbar.dart';
import 'package:smapur/views/app/features/citizendatacard/repository/tr_warga.dart';

final wargaControllerProvider = Provider((ref) {
  final repo = ref.watch(wargaRepoProvider);
  return WargaController(repo: repo);
});

class WargaController {
  final WargaRepo _repo;
  WargaController({required WargaRepo repo}) : _repo = repo;

  Future<Warga?> getWarga({BuildContext? context}) async {
    final result = await _repo.getWarga();
    return result.fold((l) {
      if (AppConfig.devMode && context != null) {
        SnackbarService.showFailedSnackbar(
            context: context,
            title: "Failed",
            message: SnackBarMessages.wargaLoadFailed);
      }
      return null;
    }, (r) {
      if (AppConfig.devMode && context != null) {
        SnackbarService.showSuccessSnackbar(
            context: context,
            title: "Success",
            message: SnackBarMessages.wargaLoadSuccess);
      }
      return r;
    });
  }
}
