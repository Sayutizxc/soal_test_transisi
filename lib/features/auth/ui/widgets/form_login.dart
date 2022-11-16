import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/padding_size.dart';
import '../../../../core/ui/widgets/loading_dialog.dart';
import '../../../list_employee/ui/pages/list_employee_page.dart';
import '../../models/login_param_model.dart';
import '../../providers/login_provider.dart';

class FormLogin extends ConsumerStatefulWidget {
  const FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends ConsumerState<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObsecureText = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.assetsLogoTransisi,
            width: size.width / 2,
          ),
          const SizedBox(height: kPaddingBig),
          TextFormField(
            controller: _usernameController,
            validator: _usernameValidation,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              filled: true,
              labelText: "Username",
            ),
          ),
          const SizedBox(height: kPaddingMedium),
          StatefulBuilder(builder: (context, setState) {
            return TextFormField(
              controller: _passwordController,
              validator: _passwordValidation,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: _isObsecureText,
              decoration: InputDecoration(
                filled: true,
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObsecureText = !_isObsecureText;
                    });
                  },
                  icon: _isObsecureText
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
              ),
            );
          }),
          const SizedBox(height: kPaddingExtraBig),
          ElevatedButton(
            onPressed: () async {
              final isValid = _formKey.currentState?.validate() ?? false;
              if (!isValid) return;
              FocusManager.instance.primaryFocus?.unfocus();
              final data = LoginParam(
                username: _usernameController.text,
                password: _passwordController.text,
              );
              showLoadingDialog(context);
              final isSuccess = await ref.read(loginProvider(data).future);
              if (!mounted) return;
              Navigator.pop(context);

              if (!isSuccess) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListEmployeePage(),
                ),
              );
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }

  String? _usernameValidation(value) {
    if (value == null) return "Username wajib diisi";
    if (value.isEmpty) return "Username wajib diisi";
    if (value.length < 4) return "Username minimal 4 karakter";
    return null;
  }

  String? _passwordValidation(value) {
    if (value == null) return "Password wajib diisi";
    if (value.isEmpty) return "Password wajib diisi";
    if (value.length < 8) return "Password minimal 8 karakter";
    return null;
  }
}
