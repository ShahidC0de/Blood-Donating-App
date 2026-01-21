import 'package:blood_dontating_app/features/auth/domain/models/auth_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  AuthRepository(this._firebaseAuth);
  AuthUser _mapFirebaseUserToAuthUser(User user) {
    return AuthUser(
      uid: user.uid,
      email: user.email ?? "",
      isEmailVerified: user.emailVerified,
    );
  }

  // Create user with phone and password
  Future<AuthUser> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return _mapFirebaseUserToAuthUser(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Sign in user with phone and password
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return _mapFirebaseUserToAuthUser(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<AuthUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((User? user) {
      if (user != null) {
        return _mapFirebaseUserToAuthUser(user);
      } else {
        return null;
      }
    });
  }
}

// log out of user
