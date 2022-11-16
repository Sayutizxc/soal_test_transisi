import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/core/providers/token_provider.dart';
import 'package:soal_test_transisi/core/ui/widgets/snackbar.dart';

import '../models/login_param_model.dart';
import '../repositories/login_repository.dart';

final loginProvider =
    FutureProvider.family<bool, LoginParam>((ref, param) async {
  final result = await ref.watch(loginRepositoryProvider).login(param: param);
  return result.fold((failure) {
    Notif.errorSnackbar(message: failure.info);
    return false;
  }, (data) async {
    if (data.token == null) {
      Notif.errorSnackbar();
      return false;
    }
    await ref.read(tokenProvider.notifier).addToken(token: data.token ?? "");
    return true;
  });
});
