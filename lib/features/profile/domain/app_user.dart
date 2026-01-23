import 'dart:io';

class AppUser {
  final String name;
  final String phoneNumber;
  final String bloodGroup;
  final String city;
  final String age;
  final String gender;
  final String wantToBeDonor;
  final String about;
  final File profileImage;
  AppUser({
    required this.name,
    required this.phoneNumber,
    required this.bloodGroup,
    required this.city,
    required this.age,
    required this.gender,
    required this.wantToBeDonor,
    required this.about,
    required this.profileImage,
  });
}
