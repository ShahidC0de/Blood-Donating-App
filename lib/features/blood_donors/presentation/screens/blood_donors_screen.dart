import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/blood_donors/presentation/widgets/donor_widget.dart';
import 'package:blood_dontating_app/features/home/presentation/screens/posted_person_profle.dart';
import 'package:flutter/material.dart';

class BloodDonorsScreen extends StatelessWidget {
  const BloodDonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blood Donors")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Select Place',
                    style: AppPallete.subHeadingText.copyWith(fontSize: 15),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.location_city,
                    size: 30,
                    color: AppPallete.buttonColor,
                  ),
                  SizedBox(width: 8),

                  Text(
                    'Mingora',
                    style: AppPallete.subHeadingText.copyWith(
                      fontSize: 18,
                      color: AppPallete.buttonColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostedPersonProfle(),
                        ),
                      );
                    },
                    child: const DonorWidget(
                      imageUrl: "assets/images/savelives.png",
                      donorName: "John Doe",
                      bloodType: "O+",
                      contactNumber: "0300-1234567",
                      wantingToDonate: true,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
