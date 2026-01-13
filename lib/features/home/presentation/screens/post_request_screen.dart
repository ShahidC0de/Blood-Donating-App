import 'dart:io';

import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => CreatePostScreen());
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Post',
          style: AppPallete.subHeadingText.copyWith(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                  // borderType: BorderType.RRect,
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
                            : Text('Upload Patient Image Situation'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(color: AppPallete.borderColor),
            ],
          ),
        ),
      ),
    );
  }
}
