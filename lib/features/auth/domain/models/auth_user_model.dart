class AuthUser {
  final String? uid;
  final String email;
  final bool isEmailVerified;

  AuthUser({this.uid, required this.email, required this.isEmailVerified});
}
