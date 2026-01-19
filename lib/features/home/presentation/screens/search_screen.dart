import 'package:blood_dontating_app/core/constants/constants.dart';
import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/home/presentation/widgets/blood_post_widget.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/customfield.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search'), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customfield(hintText: 'Search', icon: Icons.search),
              SizedBox(height: 30),
              Text('Blood Groups', style: AppPallete.subHeadingText),
              SizedBox(height: 15),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: bloodGroupIcons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final bloodGroupIcon = bloodGroupIcons[index];
                  return Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppPallete.buttonColor,
                        width: 1.5,
                      ),
                    ),
                    child: Image.asset(bloodGroupIcon["icon"]!, scale: 2.5),
                  );
                },
              ),
              SizedBox(height: 30),

              Text('Recently Posted', style: AppPallete.subHeadingText),
              SizedBox(height: 15),
              BloodPostWidget(),
              BloodPostWidget(),
              BloodPostWidget(),
              Image.asset(
                'assets/images/nothing_found.png',
              ), // if the searched result is empty
            ],
          ),
        ),
      ),
    );
  }
}
