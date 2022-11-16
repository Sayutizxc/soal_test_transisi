import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/core/constants/padding_size.dart';
import 'package:soal_test_transisi/core/ui/theme/text_style.dart';
import 'package:soal_test_transisi/core/ui/widgets/snackbar.dart';
import 'package:soal_test_transisi/core/providers/list_employee_provider.dart';
import 'package:soal_test_transisi/features/create_or_update_employee/ui/pages/create_or_update_employee_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/employee_info_item.dart';

class DetailEmployeePage extends ConsumerWidget {
  const DetailEmployeePage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullname = ref.watch(listEmployeeProvider.select((value) {
      final employee = value[index].values.first;
      return "${employee.firstName ?? ""} ${employee.lastName ?? ""}";
    }));

    final phoneNumber = ref.watch(
      listEmployeeProvider.select((value) {
        return value[index].values.first.phoneNumber ?? "";
      }),
    );

    final email = ref.watch(
      listEmployeeProvider.select((value) {
        return value[index].values.first.email ?? "";
      }),
    );

    final website = ref.watch(
      listEmployeeProvider.select((value) {
        return value[index].values.first.website ?? "";
      }),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PhotoProfile(index),
                  const SizedBox(height: kPaddingMedium),
                  Text(
                    fullname,
                    style: AppTextStyle.medium(color: Colors.white),
                  )
                ],
              ),
            ),
            expandedHeight: 300,
            actions: [
              Consumer(builder: (context, ref, child) {
                final employee = ref.watch(
                    listEmployeeProvider.select((value) => value[index]));
                final isFavorite = employee.values.first.isFavofite ?? false;
                return IconButton(
                  onPressed: () {
                    ref
                        .read(listEmployeeStateNotifierProvider.notifier)
                        .toogleFavorite(index: employee.keys.first);
                  },
                  icon: isFavorite
                      ? const Icon(Icons.star)
                      : const Icon(Icons.star_border),
                );
              }),
              Consumer(builder: (context, ref, child) {
                final employee = ref.watch(
                  listEmployeeProvider.select((value) => value[index]),
                );
                return IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CreateOrUpdateEmployeePage(
                            employee: employee,
                          );
                        },
                      ));
                    },
                    icon: const Icon(Icons.edit));
              })
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            EmployeeInfoItem(
              title: phoneNumber,
              leadingIcon: Icons.phone,
              trailingIcon: Icons.sms,
              subtitle: "Telephone",
              leadingIconOnTap: () => _launch("tel:$phoneNumber"),
              trailingIconOnTap: () => _launch("sms:$phoneNumber"),
            ),
            EmployeeInfoItem(
              title: email,
              leadingIcon: Icons.email,
              subtitle: "E-Mail",
              onTap: () => _launch("mailto:$email"),
            ),
            EmployeeInfoItem(
              title: website,
              leadingIcon: Icons.web,
              subtitle: "Website",
              onTap: () => _launch(
                website.contains("http") ? website : "https://$website",
              ),
            ),
          ])),
        ],
      ),
    );
  }

  void _launch(String stringUri) async {
    final uri = Uri.tryParse(stringUri);
    if ((uri != null) && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Notif.errorSnackbar(message: "Invalid Data");
    }
  }
}

class PhotoProfile extends ConsumerWidget {
  const PhotoProfile(
    this.index, {
    Key? key,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatar = ref.watch(listEmployeeProvider
        .select((value) => value[index].values.first.avatar));
    final isNetworkImage = avatar?.startsWith("http") ?? false;
    return CircleAvatar(
      radius: 60,
      foregroundImage: (avatar == null)
          ? null
          : ((isNetworkImage)
              ? NetworkImage(avatar)
              : MemoryImage(base64Decode(avatar))) as ImageProvider,
      child: const Icon(
        Icons.person,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
