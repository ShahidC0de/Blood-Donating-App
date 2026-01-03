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
  String? selectedBloodGroup;
  String? selectedCity;

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

            Spacer(),
            AuthButton(onpressed: () {}, title: 'Next'),
          ],
        ),
      ),
    );
  }
}
