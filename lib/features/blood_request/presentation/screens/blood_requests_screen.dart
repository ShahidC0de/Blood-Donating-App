import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/home/presentation/domain/blood_request_model.dart';
import 'package:blood_dontating_app/features/home/presentation/screens/posted_details_screen.dart';
import 'package:blood_dontating_app/features/home/presentation/widgets/blood_post_widget.dart';
import 'package:flutter/material.dart';

class BloodNeededScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const BloodNeededScreen());
  const BloodNeededScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Needed',
          style: AppPallete.subHeadingText.copyWith(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Blood Requests',
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
                      fontSize: 20,
                      color: AppPallete.buttonColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PostedDetailsScreen.route(
                            BloodPostModel(
                              postId: '123',
                              userId: '321',
                              imagePath: 'assets/images/savelives.png',
                              contactPerson: 'contactPerson',
                              contactNumber: 'contactNumber',
                              quantityNeeded: 1,
                              city: 'city',
                              bloodType: 'bloodType',
                              hospitalName: 'hospitalName',
                              additionalNotes: 'additionalNotes',
                            ),
                          ),
                        );
                      },
                      child: BloodPostWidget(),
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
