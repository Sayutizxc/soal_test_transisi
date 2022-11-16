import 'package:flutter/material.dart';

import '../../constants/padding_size.dart';

class ErrorButton extends StatelessWidget {
  const ErrorButton({
    Key? key,
    required this.error,
    this.onPressed,
  }) : super(key: key);
  final String error;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(kPaddingMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
          const SizedBox(height: kPaddingBig),
          ElevatedButton(onPressed: onPressed, child: const Text("Muat Ulang."))
        ],
      ),
    ));
  }
}
