import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/core/ui/theme/elevated_button_style.dart';
import 'package:soal_test_transisi/core/utils/logging.dart';

import 'core/providers/token_provider.dart';
import 'core/utils/snackbar_key.dart';
import 'features/auth/ui/pages/login_page.dart';
import 'features/list_employee/ui/pages/list_employee_page.dart';

class EmployeeDataManagementApp extends StatelessWidget {
  const EmployeeDataManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Data Management',
      scaffoldMessengerKey: snackbarKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        elevatedButtonTheme: kElevatedButtonStyle,
      ),
      home: const InitialPage(),
    );
  }
}

class InitialPage extends ConsumerStatefulWidget {
  const InitialPage({super.key});

  @override
  ConsumerState<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends ConsumerState<InitialPage> {
  bool? hasToken;
  @override
  void initState() {
    super.initState();
    _getToken();
  }

  void _getToken() async {
    hasToken = await ref.read(tokenProvider.notifier).hasToken();
    logger.i("Has Token : $hasToken");
    _isLoggin(hasToken);
  }

  void _isLoggin(bool? hasToken) {
    if (hasToken == null) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return hasToken ? const ListEmployeePage() : const LoginPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (hasToken == null)
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox(),
    );
  }
}
