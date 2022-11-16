import 'package:flutter/material.dart';

import '../../../../core/constants/padding_size.dart';
import '../widgets/form_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(kPaddingMedium),
        child: Center(
          child: Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(kPaddingMedium),
              child: FormLogin(),
            ),
          ),
        ),
      ),
    );
  }
}
