import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/features/create_or_update_employee/ui/pages/create_or_update_employee_page.dart';
import 'package:soal_test_transisi/core/providers/list_employee_provider.dart';

import '../../../../core/ui/widgets/error_button.dart';
import '../widgets/list_employee.dart';

class ListEmployeePage extends ConsumerWidget {
  const ListEmployeePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listEmployee = ref.watch(listEmployeeStateNotifierProvider);
    final isSearchBarVisible = ref.watch(toggleSearchProvider);
    return Scaffold(
      appBar: AppBar(
        title: isSearchBarVisible
            ? TextField(
                onChanged: (value) {
                  ref
                      .read(filterListEmployeeProvider.notifier)
                      .update((_) => value);
                },
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white54,
                decoration: InputDecoration(
                  hintText: "Search Employee...",
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.indigo.shade800,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white60,
                    ),
                    onPressed: () {
                      ref
                          .read(filterListEmployeeProvider.notifier)
                          .update((_) => "");
                      ref
                          .read(toggleSearchProvider.notifier)
                          .update((state) => false);
                    },
                  ),
                ),
              )
            : const Text("List Employee"),
        actions: [
          if (!isSearchBarVisible)
            IconButton(
              onPressed: () {
                ref.read(toggleSearchProvider.notifier).update((state) => true);
              },
              icon: const Icon(Icons.search),
            ),
        ],
      ),
      body: listEmployee.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => ErrorButton(
          error: err.toString(),
          onPressed: () async =>
              await ref.refresh(listEmployeeStateNotifierProvider),
        ),
        data: (_) => const ListEmployee(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CreateOrUpdateEmployeePage()),
          );
        },
      ),
    );
  }
}
