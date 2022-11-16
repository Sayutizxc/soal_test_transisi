import 'package:flutter/material.dart';

import '../../constants/padding_size.dart';

Future showLoadingDialog(BuildContext context, {String? message}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return UnconstrainedBox(
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(kPaddingBig),
            child: Center(
                child: Column(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: kPaddingBig),
                Text(message ?? "Harap tunggu"),
              ],
            )),
          ),
        ),
      );
    },
  );
}
