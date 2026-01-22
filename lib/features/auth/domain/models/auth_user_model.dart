import 'package:blood_dontating_app/core/models/core_user.dart';

class AuthUser implements CoreCurrentUser {
  final String? uid;
  final String email;
  final bool isEmailVerified;

  AuthUser({this.uid, required this.email, required this.isEmailVerified});

  @override
  String? getEmail() => email;

  @override
  String? getId() => uid;

  @override
  bool? emailVerifiedOrNot() => isEmailVerified;
}
