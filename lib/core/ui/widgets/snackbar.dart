import 'package:flutter/material.dart';
import 'package:soal_test_transisi/core/constants/error_message.dart';

import '../../utils/snackbar_key.dart';

class Notif {
  const Notif._();
  static _snackbar({String? message, required Color color}) {
    return SnackBar(
      content: Text(
        message ?? ErrorMessage.unknownException,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  static void errorSnackbar({String? message}) {
    snackbarKey.currentState?.clearSnackBars();
    snackbarKey.currentState?.showSnackBar(
      _snackbar(color: Colors.red, message: message),
    );
  }

  static void successSnackbar({String? message}) {
    snackbarKey.currentState?.clearSnackBars();
    snackbarKey.currentState?.showSnackBar(
      _snackbar(color: Colors.green, message: message),
    );
  }
}
