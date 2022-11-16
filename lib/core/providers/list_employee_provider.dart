import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/core/models/employee_model.dart';
import 'package:soal_test_transisi/features/list_employee/models/list_employee_model.dart';
import 'package:soal_test_transisi/core/repositories/list_employee_repository.dart';

final toggleSearchProvider = StateProvider<bool>((ref) {
  return false;
});

final filterListEmployeeProvider = StateProvider<String>((ref) {
  return "";
});

final listEmployeeProvider =
    StateProvider<List<Map<int, EmployeeModel>>>((ref) {
  final employees =
      (ref.watch(listEmployeeStateNotifierProvider).asData?.value.data ?? [])
          .asMap();
  final filter = ref.watch(filterListEmployeeProvider);
  List<Map<int, EmployeeModel>> data = [];
  employees.forEach((key, value) {
    if ("${value.firstName} ${value.lastName}".toLowerCase().contains(filter)) {
      data.add({key: value});
    }
  });
  return data;
});

final listEmployeeStateNotifierProvider =
    StateNotifierProvider<_ListEmployeeNotifier, AsyncValue<ListEmployeeModel>>(
  (ref) => _ListEmployeeNotifier(ref)..getListEmployee(),
);

class _ListEmployeeNotifier
    extends StateNotifier<AsyncValue<ListEmployeeModel>> {
  _ListEmployeeNotifier(this.ref) : super(const AsyncLoading());

  final Ref ref;

  Future<void> getListEmployee({int? page}) async {
    final result = await ref
        .read(listEmployeeRepositoryProvider)
        .getListEmployee(page: page);
    state = result.fold(
      (error) => AsyncError(error.info, StackTrace.current),
      (data) => AsyncData(data),
    );
  }

  Future<bool> createEmployee({required EmployeeModel employee}) async {
    final result =
        await ref.read(listEmployeeRepositoryProvider).createEmployee(employee);
    return result.fold(
      (error) {
        state = AsyncError(error.info, StackTrace.current);
        return false;
      },
      (data) {
        final newValue = [...state.value?.data ?? <EmployeeModel>[], data];
        if (state.value == null) {
          state = AsyncData(state.value ?? ListEmployeeModel());
          return false;
        }
        state = AsyncData(state.value!.copyWith(data: newValue));
        return true;
      },
    );
  }

  Future<bool> updateEmployee(
      {required EmployeeModel employee, required int index}) async {
    final result =
        await ref.read(listEmployeeRepositoryProvider).createEmployee(employee);
    return result.fold(
      (error) {
        state = AsyncError(error.info, StackTrace.current);
        return false;
      },
      (data) {
        final listEmployee = (state.asData?.value.data?..[index] = data) ?? [];
        if (state.value?.data == null) return false;
        state = AsyncData(state.value!.copyWith(data: listEmployee));
        return true;
      },
    );
  }

  void toogleFavorite({required int index}) {
    EmployeeModel? employee = state.value?.data?[index];
    if (employee == null) return;
    final listEmployee = (state.asData?.value.data
          ?..[index] = employee.copyWith(
            isFavofite: !(employee.isFavofite ?? false),
          )) ??
        [];
    if (state.value?.data == null) return;
    state = AsyncData(state.value!.copyWith(data: listEmployee));
  }
}
