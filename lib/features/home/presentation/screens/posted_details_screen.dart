import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/blood_request/presentation/widgets/custom_tile.dart';
import 'package:blood_dontating_app/features/home/presentation/domain/blood_request_model.dart';
import 'package:blood_dontating_app/features/home/presentation/screens/posted_person_profle.dart';
import 'package:flutter/material.dart';

class PostedDetailsScreen extends StatefulWidget {
  final BloodPostModel bloodRequest;
  static route(BloodPostModel bloodRequest) => MaterialPageRoute(
    builder: (context) => PostedDetailsScreen(bloodRequest: bloodRequest),
  );
  const PostedDetailsScreen({super.key, required this.bloodRequest});

  @override
  State<PostedDetailsScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<PostedDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posted Details',
          style: AppPallete.subHeadingText.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: AppPallete.borderColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppPallete.borderColor, width: 2),
                ),
                child: Image.asset(
                  'assets/images/savelives.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostedPersonProfle(),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 40,
                  child: Image.asset('assets/images/savelives.png', scale: 1),
                ),
              ),
              SizedBox(height: 5),
              Divider(
                color: AppPallete.borderColor.withValues(alpha: 0.5),
                thickness: 1,
              ),
              SizedBox(height: 5),
              CustomTile(
                icon: Icons.person_outline,
                title1: 'Contact Person',
                titleValue: widget.bloodRequest.contactPerson,
              ),
              Divider(
                color: AppPallete.borderColor.withValues(alpha: 0.5),
                thickness: 1,
              ),
              CustomTile(
                icon: Icons.phone_outlined,
                title1: 'Phone No',
                titleValue: widget.bloodRequest.contactNumber,
              ),
              Divider(
                color: AppPallete.borderColor.withValues(alpha: 0.5),
                thickness: 1,
              ),
              CustomTile(
                icon: Icons.bloodtype_outlined,
                title1: 'How many bags',
                titleValue: widget.bloodRequest.quantityNeeded.toString(),
              ),
              Divider(
                color: AppPallete.borderColor.withValues(alpha: 0.5),
                thickness: 1,
              ),
              CustomTile(
                icon: Icons.location_city_outlined,
                title1: 'City',
                titleValue: widget.bloodRequest.city,
              ),
              Divider(
                color: AppPallete.borderColor.withValues(alpha: 0.5),
                thickness: 1,
              ),

              CustomTile(
                icon: Icons.local_hospital_outlined,
                title1: 'Hospital',
                titleValue: widget.bloodRequest.hospitalName,
              ),
              SizedBox(height: 15),
              Text(
                'Description',
                style: AppPallete.subHeadingText.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                maxLines: 5,
                widget.bloodRequest.additionalNotes,
                style: AppPallete.subHeadingText.copyWith(
                  fontSize: 15,
                  color: AppPallete.borderColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
