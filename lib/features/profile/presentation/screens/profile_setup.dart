import 'package:blood_dontating_app/core/constants/constants.dart';
import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/customfield.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';

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
  }

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
            Text(
              "Almost done! Let\'s set up your profile. It's easy, Just three easy steps",
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

            Customfield(hintText: 'Your Name'),
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

            Spacer(),
            AuthButton(
              onpressed: () {
                Navigator.push(context, ProfileSetup2.route());
              },
              title: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSetup2 extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ProfileSetup2());
  const ProfileSetup2({super.key});

  @override
  State<ProfileSetup2> createState() => _ProfileSetup2State();
}

class _ProfileSetup2State extends State<ProfileSetup2> {
  String? selectedGender;
  String? wantToBeDonor;

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
                    return DropdownMenuItem(value: gender, child: Text(gender));
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
            Customfield(hintText: 'Type about yourself', maxLines: 4),
            Spacer(),
            AuthButton(onpressed: () {}, title: "Next"),
          ],
        ),
      ),
    );
  }
}
