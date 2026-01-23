import 'dart:io';

import 'package:blood_dontating_app/core/constants/constants.dart';
import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/home/presentation/screens/home_screen.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/customfield.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/login_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetup extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ProfileSetup());
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  DateTime? selectedDob;
  final TextEditingController dobController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  Future<void> pickDob() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDob = pickedDate;
        dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  String? selectedBloodGroup;
  String? selectedCity;
  @override
  void dispose() {
    super.dispose();
    dobController.dispose();
    nameController.dispose();
    numberController.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile Setup', style: AppPallete.headingText),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Almost done! Let's set up your profile. It's easy, Just three easy steps",
                  style: AppPallete.subHeadingText,
                ),
                const SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: AppPallete.lightGreyColor,
                    child: Icon(
                      Icons.person_outline,
                      size: 40,
                      color: AppPallete.buttonColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Personal Information',
                    style: AppPallete.headingText.copyWith(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Customfield(
                  hintText: 'Your Name',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    if (value.length < 6) {
                      return "Name must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Customfield(
                  hintText: 'Start From 03',
                  controller: numberController,
                  inputType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number is Required";
                    }
                    if (value.length < 6) {
                      return "The way we see it, It should be 11 numbers";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  'Blood Group',
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
                    border: Border.all(color: AppPallete.borderColor, width: 1),
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
                        return DropdownMenuItem(
                          value: group,
                          child: Text(group),
                        );
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
                  'City',
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
                    border: Border.all(color: AppPallete.borderColor, width: 1),
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
                //date of birth
                Text(
                  'Date of Birth',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: pickDob,
                  child: AbsorbPointer(
                    child: Customfield(
                      hintText: 'Select Date of Birth',
                      controller: dobController,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Age: ${selectedDob != null ? DateTime.now().year - selectedDob!.year : ''}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                AuthButton(
                  onpressed: () {
                    if (!formKey.currentState!.validate()) return;
                    if (selectedBloodGroup == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select your blood group"),
                        ),
                      );
                      return;
                    }
                    if (selectedCity == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please select your city")),
                      );
                      return;
                    }
                    if (selectedDob == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select your date of birth"),
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileSetup2(
                          name: nameController.text,
                          phoneNumber: numberController.text,
                          bloodGroup: selectedBloodGroup!,
                          city: selectedCity!,
                          dateOfBirth:
                              "${selectedDob != null ? DateTime.now().year - selectedDob!.year : ''}",
                        ),
                      ),
                    );
                  },
                  title: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//........................................................................................................................................................

class ProfileSetup2 extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String bloodGroup;
  final String city;
  final String dateOfBirth;

  const ProfileSetup2({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.bloodGroup,
    required this.city,
    required this.dateOfBirth,
  });

  @override
  State<ProfileSetup2> createState() => _ProfileSetup2State();
}

class _ProfileSetup2State extends State<ProfileSetup2> {
  String? selectedGender;
  String? wantToBeDonor;
  final TextEditingController aboutController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    aboutController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile Setup', style: AppPallete.headingText),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "And we are almost here! Just a few more details to complete your profile.",
                  style: AppPallete.subHeadingText,
                ),
                const SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: AppPallete.lightGreyColor,
                    child: Icon(
                      Icons.person_outline,
                      size: 40,
                      color: AppPallete.buttonColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Personal Information',
                    style: AppPallete.headingText.copyWith(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Gender',
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
                    border: Border.all(color: AppPallete.borderColor, width: 1),
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
                        'Select Gender',
                        style: TextStyle(color: AppPallete.fieldTextColor),
                      ),
                      value: selectedGender,
                      items: genders.map((gender) {
                        return DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Do you want to be a blood donor?',
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
                    border: Border.all(color: AppPallete.borderColor, width: 1),
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
                        'Want to be a donor?',
                        style: TextStyle(color: AppPallete.fieldTextColor),
                      ),
                      value: wantToBeDonor,
                      items: decisions.map((decision) {
                        return DropdownMenuItem(
                          value: decision,
                          child: Text(decision),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          wantToBeDonor = value!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'About yourself',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Customfield(
                  hintText: 'Type about yourself',
                  maxlines: 8,
                  controller: aboutController,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    if (value == null) {
                      return "All the fields are mendatory ";
                    } else if (value.length < 8) {
                      return "Tell us about yourself briefly ";
                    }
                  },
                ),
                const SizedBox(height: 30),

                AuthButton(
                  onpressed: () {
                    if (formkey.currentState!.validate() &&
                        selectedGender != null &&
                        wantToBeDonor != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileSetup3(
                            name: widget.name,
                            phoneNumber: widget.phoneNumber,
                            bloodGroup: widget.bloodGroup,
                            selectedCity: widget.city,
                            age: widget.dateOfBirth,
                            selectedGender: selectedGender!,
                            wantToBeDonor: wantToBeDonor!,
                            aboutUser: aboutController.text,
                          ),
                        ),
                      );
                    }
                  },
                  title: "Next",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileSetup3 extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String bloodGroup;
  final String selectedCity;
  final String age;
  final String selectedGender;
  final String wantToBeDonor;
  final String aboutUser;
  const ProfileSetup3({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.bloodGroup,
    required this.selectedCity,
    required this.age,
    required this.selectedGender,
    required this.wantToBeDonor,
    required this.aboutUser,
  });

  @override
  State<ProfileSetup3> createState() => _ProfileSetup3State();
}

class _ProfileSetup3State extends State<ProfileSetup3> {
  XFile? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile Setup', style: AppPallete.headingText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Ready in a moment! Just a profile photo to complete your profile.",
              style: AppPallete.subHeadingText,
            ),
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundColor: AppPallete.lightGreyColor,
                child: Icon(
                  Icons.person_outline,
                  size: 40,
                  color: AppPallete.buttonColor,
                ),
              ),
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 20),

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
                      _pickedImage != null ? SizedBox() : Text('Upload Image'),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            AuthButton(
              onpressed: () {
                Navigator.pushReplacement(context, HomeScreen.route());
              },
              title: 'Home',
            ),

            //  Center(
            //   child: Text(
            //     'Profile Setup Complete!',
            //     style: AppPallete.headingText.copyWith(fontSize: 18),
            //   ),
            // ),

            // Center(
            //   child: CircleAvatar(
            //     radius: 45,
            //     backgroundColor: AppPallete.lightGreyColor,
            //     child: Icon(
            //       Icons.check_circle_outline,
            //       size: 40,
            //       color: AppPallete.buttonColor,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 10),
            // Center(
            //   child: Text(
            //     'Thank you for completing your profile. You are now ready to explore the app and connect with others.',
            //     style: AppPallete.subHeadingText,
            //     textAlign: TextAlign.center,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
