import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/features/detail_employee/ui/pages/detail_employee_page.dart';

import '../../../../core/providers/list_employee_provider.dart';

class ListEmployee extends ConsumerWidget {
  const ListEmployee({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length =
        ref.watch(listEmployeeProvider.select((value) => value.length));
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        final fullname = ref.watch(listEmployeeProvider.select((value) {
          if (value.length > index) {
            final employee = value[index].values.first;
            return "${employee.firstName ?? ""} ${employee.lastName ?? ""}";
          }
        }));

        final phoneNumber = ref.watch(
          listEmployeeProvider.select((value) {
            if (value.length > index) {
              return value[index].values.first.phoneNumber ?? "";
            }
          }),
        );

        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailEmployeePage(
                  index: index,
                );
              },
            ));
          },
          leading: ProfileImage(index),
          title: Text(fullname ?? ""),
          subtitle: Text(phoneNumber ?? "-"),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          trailing: Consumer(
            builder: (context, ref, child) {
              final employee = ref.watch(listEmployeeProvider.select((value) {
                if (value.length > index) {
                  return value[index];
                }
              }));
              final isFavorite = employee?.values.first.isFavofite ?? false;
              return IconButton(
                icon: isFavorite
                    ? const Icon(Icons.star, color: Colors.indigo)
                    : const Icon(Icons.star_border),
                onPressed: () {
                  ref
                      .read(listEmployeeStateNotifierProvider.notifier)
                      .toogleFavorite(index: employee?.keys.first ?? -1);
                },
              );
            },
          ),
        );
      },
    );
  }
}

class ProfileImage extends ConsumerWidget {
  const ProfileImage(
    this.index, {
    Key? key,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstName = ref.watch(listEmployeeProvider.select((value) {
      if (value.length > index) {
        return value[index].values.first.firstName ?? "";
      }
    }));

    final avatar = ref.watch(listEmployeeProvider.select((value) {
      if (value.length > index) {
        return value[index].values.first.avatar;
      }
    }));

    final isNetworkImage = avatar?.startsWith("http") ?? false;

    return CircleAvatar(
      foregroundImage: (avatar == null)
          ? null
          : ((isNetworkImage)
              ? NetworkImage(avatar)
              : MemoryImage(base64Decode(avatar))) as ImageProvider,
      child: Text(firstName?[0] ?? "#"),
    );
  }
}
