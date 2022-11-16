import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/core/constants/padding_size.dart';
import 'package:soal_test_transisi/core/ui/widgets/loading_dialog.dart';
import 'package:soal_test_transisi/core/ui/widgets/snackbar.dart';
import 'package:soal_test_transisi/core/providers/list_employee_provider.dart';

import '../../../../core/models/employee_model.dart';
import '../widgets/form_create_employee.dart';

class CreateOrUpdateEmployeePage extends ConsumerStatefulWidget {
  const CreateOrUpdateEmployeePage({this.employee, super.key});
  final Map<int, EmployeeModel>? employee;

  @override
  ConsumerState<CreateOrUpdateEmployeePage> createState() =>
      _CreateOrUpdateEmployeePageState();
}

class _CreateOrUpdateEmployeePageState
    extends ConsumerState<CreateOrUpdateEmployeePage> {
  final GlobalKey<FormCreateOrUpdateEmployeeState> formCreateEmployeeKey =
      GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Employee"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final state = formCreateEmployeeKey.currentState;
              final isValid = state?.formKey.currentState?.validate() ?? false;
              if (!isValid) return;
              final employee = EmployeeModel(
                firstName: _returnNullIfEmpty(state?.firstNameController),
                lastName: _returnNullIfEmpty(state?.lastNameController),
                email: _returnNullIfEmpty(state?.emailController),
                phoneNumber: _returnNullIfEmpty(state?.telephoneController),
                job: _returnNullIfEmpty(state?.jobController),
                website: _returnNullIfEmpty(state?.websiteController),
                isFavofite: widget.employee?.values.first.isFavofite ?? false,
                avatar: state?.imageBase64,
              );
              showLoadingDialog(context);
              bool isSuccess;
              bool isCreateNewEmployee = widget.employee == null;
              if (isCreateNewEmployee) {
                isSuccess = await ref
                    .read(listEmployeeStateNotifierProvider.notifier)
                    .createEmployee(employee: employee);
              } else {
                isSuccess = await ref
                    .read(listEmployeeStateNotifierProvider.notifier)
                    .updateEmployee(
                      employee: employee,
                      index: widget.employee!.keys.first,
                    );
              }
              if (!mounted) return;
              if (isSuccess) {
                Notif.successSnackbar(
                  message:
                      "Employee successfully ${isCreateNewEmployee ? "created" : "updated"}",
                );
                Navigator.pop(context);
              } else {
                Notif.errorSnackbar(
                  message:
                      "Employee failed to ${isCreateNewEmployee ? "created" : "updated"}",
                );
              }
              Navigator.pop(context);
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPaddingMedium),
          child: FormCreateOrUpdateEmployee(
            key: formCreateEmployeeKey,
            employee: widget.employee,
          ),
        ),
      ),
    );
  }

  String? _returnNullIfEmpty(TextEditingController? controller) {
    if (controller == null) return null;
    if (controller.text.trim().isEmpty) return null;
    return controller.text;
  }
}
