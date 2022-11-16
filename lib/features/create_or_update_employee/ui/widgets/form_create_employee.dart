import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/padding_size.dart';
import '../../../../core/models/employee_model.dart';

class FormCreateOrUpdateEmployee extends StatefulWidget {
  const FormCreateOrUpdateEmployee({
    Key? key,
    this.employee,
  }) : super(key: key);

  final Map<int, EmployeeModel>? employee;
  @override
  State<FormCreateOrUpdateEmployee> createState() =>
      FormCreateOrUpdateEmployeeState();
}

class FormCreateOrUpdateEmployeeState
    extends State<FormCreateOrUpdateEmployee> {
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController jobController;
  late TextEditingController telephoneController;
  late TextEditingController emailController;
  late TextEditingController websiteController;
  String? imageBase64;
  @override
  void initState() {
    super.initState();
    final employee = widget.employee?.values.first;
    firstNameController = TextEditingController(text: employee?.firstName);
    lastNameController = TextEditingController(text: employee?.lastName);
    jobController = TextEditingController(text: employee?.job);
    telephoneController = TextEditingController(text: employee?.phoneNumber);
    emailController = TextEditingController(text: employee?.email);
    websiteController = TextEditingController(text: employee?.website);
    imageBase64 = employee?.avatar;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    jobController.dispose();
    telephoneController.dispose();
    emailController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = imageBase64?.startsWith("http") ?? false;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: kPaddingBig),
          CircleAvatar(
            radius: 64,
            backgroundImage: (imageBase64 == null)
                ? null
                : ((isNetworkImage)
                    ? NetworkImage(imageBase64!)
                    : MemoryImage(base64Decode(imageBase64!))) as ImageProvider,
            child: IconButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image == null) return;
                final imageBytes = await image.readAsBytes();
                setState(() {
                  imageBase64 = base64Encode(imageBytes);
                });
              },
              icon: const Icon(Icons.photo_camera),
            ),
          ),
          const SizedBox(height: kPaddingMedium),
          TextFormField(
            controller: firstNameController,
            validator: (value) {
              if (value == null) return "Fist Name wajib diisi";
              if (value.isEmpty) return "Fist Name wajib diisi";
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: "First Name",
            ),
          ),
          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: "Last Name",
            ),
          ),
          TextFormField(
            controller: jobController,
            decoration: const InputDecoration(
              icon: Icon(Icons.work),
              labelText: "Job",
            ),
          ),
          TextFormField(
            controller: telephoneController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null) return "Telephone wajib diisi";
              if (value.isEmpty) return "Telephone wajib diisi";
              if (value.length < 10) return "Telephone minimal 10 angka";
              return null;
            },
            maxLength: 16,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              labelText: "Telephone",
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              labelText: "Email",
            ),
          ),
          TextFormField(
            controller: websiteController,
            decoration: const InputDecoration(
              icon: Icon(Icons.web),
              labelText: "Website",
            ),
          ),
        ],
      ),
    );
  }
}
