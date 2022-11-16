import 'package:flutter/material.dart';

import '../../../../core/constants/padding_size.dart';

class EmployeeInfoItem extends StatelessWidget {
  const EmployeeInfoItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.leadingIconOnTap,
    this.trailingIconOnTap,
  });
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final void Function()? onTap;
  final void Function()? leadingIconOnTap;
  final void Function()? trailingIconOnTap;

  @override
  Widget build(BuildContext context) {
    if (title.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(
        left: kPaddingMedium,
        top: kPaddingSmall,
        right: kPaddingMedium,
      ),
      child: Card(
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 0,
          leading: AspectRatio(
            aspectRatio: 1,
            child: IconButton(
              onPressed: leadingIconOnTap,
              icon: Icon(
                leadingIcon,
                color: Colors.indigo,
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text(subtitle ?? ""),
          trailing: AspectRatio(
            aspectRatio: 1,
            child: IconButton(
              onPressed: trailingIconOnTap,
              icon: Icon(
                trailingIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
