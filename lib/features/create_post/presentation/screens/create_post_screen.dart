import 'dart:io';

import 'package:blood_dontating_app/core/constants/constants.dart';
import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/customfield.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/login_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String? selectedCity;
  String? selectedBloodGroup;
  XFile? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Post")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  final image = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    setState(() {
                      _pickedImage = image;
                    });
                  }
                },
                child: DottedBorder(
                  color: AppPallete.borderColor,
                  strokeWidth: 1,
                  dashPattern: const [6, 4],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(5),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _pickedImage != null
                            ? CircleAvatar(
                                radius: 50,

                                backgroundImage: FileImage(
                                  File(_pickedImage!.path),
                                ),
                              )
                            : Icon(
                                Icons.photo,
                                size: 50,
                                color: AppPallete.fieldTextColor,
                              ),
                        _pickedImage != null
                            ? SizedBox()
                            : Text("Upload Patient's Photo"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Post Title',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Customfield(hintText: 'Title of the Post'),
              const SizedBox(height: 10),
              Text(
                'What type of blood group do you need?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 30, right: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppPallete.borderColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: AppPallete.backgroundColor,
                    style: TextStyle(
                      color: AppPallete.fieldTextColor,
                      fontSize: 15,
                    ),
                    hint: Text(
                      'Select Blood Group',
                      style: TextStyle(color: AppPallete.fieldTextColor),
                    ),
                    value: selectedBloodGroup,
                    items: bloodGroups.map((group) {
                      return DropdownMenuItem(value: group, child: Text(group));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedBloodGroup = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Preferred City',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 30, right: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppPallete.borderColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: AppPallete.backgroundColor,
                    style: TextStyle(
                      color: AppPallete.fieldTextColor,
                      fontSize: 15,
                    ),
                    hint: Text(
                      'Select City',
                      style: TextStyle(color: AppPallete.fieldTextColor),
                    ),
                    value: selectedCity,
                    items: cities.map((city) {
                      return DropdownMenuItem(value: city, child: Text(city));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Name of Hospital',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Customfield(hintText: 'Hospital Name'),
              const SizedBox(height: 10),

              Text(
                'How many units of blood are required?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Customfield(hintText: 'Number of Units'),
              const SizedBox(height: 10),
              Text(
                'Contact Person Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Customfield(hintText: "Person's Contact"),
              const SizedBox(height: 10),
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Customfield(
                hintText: "Explain patient's condition, disease....",
                maxLines: 6,
              ),
              const SizedBox(height: 20),
              AuthButton(onpressed: () {}, title: 'Create Post'),
            ],
          ),
        ),
      ),
    );
  }
}
