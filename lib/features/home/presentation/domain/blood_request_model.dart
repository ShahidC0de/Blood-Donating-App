class BloodPostModel {
  final String postId;
  final String userId;
  final String imagePath;
  final String contactPerson;
  final String contactNumber;
  final int quantityNeeded;
  final String city;
  final String bloodType;
  final String hospitalName;
  final String additionalNotes;

  BloodPostModel({
    required this.postId,
    required this.userId,
    required this.imagePath,
    required this.contactPerson,
    required this.contactNumber,
    required this.quantityNeeded,
    required this.city,
    required this.bloodType,
    required this.hospitalName,
    required this.additionalNotes,
  });

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
      'imagePath': imagePath,
      'contactPerson': contactPerson,
      'contactNumber': contactNumber,
      'quantityNeeded': quantityNeeded,
      'city': city,
      'bloodType': bloodType,
      'hospitalName': hospitalName,
      'additionalNotes': additionalNotes,
    };
  }

  factory BloodPostModel.fromMap(Map<String, dynamic> map) {
    return BloodPostModel(
      postId: map['postId'] ?? '',
      userId: map['userId'] ?? '',
      imagePath: map['imagePath'] ?? '',
      contactPerson: map['contactPerson'] ?? '',
      contactNumber: map['contactNumber'] ?? '',
      quantityNeeded: map['quantityNeeded'] ?? 0,
      city: map['city'] ?? '',
      bloodType: map['bloodType'] ?? '',
      hospitalName: map['hospitalName'] ?? '',
      additionalNotes: map['additionalNotes'] ?? '',
    );
  }
}
