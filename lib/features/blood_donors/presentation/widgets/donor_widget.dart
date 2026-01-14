import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class DonorWidget extends StatelessWidget {
  final String imageUrl;
  final String donorName;
  final String bloodType;
  final String contactNumber;
  final bool wantingToDonate;
  const DonorWidget({
    super.key,
    required this.imageUrl,
    required this.donorName,
    required this.bloodType,
    required this.contactNumber,
    required this.wantingToDonate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppPallete.backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppPallete.borderColor.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: AppPallete.borderColor.withValues(alpha: 0.3),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 45, child: Image.asset(imageUrl, scale: 1)),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: AppPallete.buttonColor,
                    size: 16,
                  ),
                  SizedBox(width: 4),

                  Text(
                    donorName,
                    style: AppPallete.headingText.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.bloodtype_outlined,
                    color: AppPallete.buttonColor,
                    size: 16,
                  ),
                  SizedBox(width: 4),

                  Text(
                    bloodType,
                    style: AppPallete.subHeadingText.copyWith(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone_outlined,
                    size: 16,
                    color: AppPallete.buttonColor,
                  ),

                  SizedBox(width: 4),
                  Text(
                    contactNumber,
                    style: AppPallete.subHeadingText.copyWith(
                      fontSize: 14,
                      color: AppPallete.borderColor,
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: wantingToDonate
                          ? Colors.green
                          : AppPallete.buttonColor, // online indicator
                    ),
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
