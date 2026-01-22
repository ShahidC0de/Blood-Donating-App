import 'dart:async';

import 'package:blood_dontating_app/features/auth/data/auth_repository.dart';
import 'package:blood_dontating_app/features/auth/domain/models/auth_user_model.dart';
import 'package:blood_dontating_app/features/auth/providers/authentication_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, AuthUser?>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<AuthUser?> {
  late final AuthRepository _repository;

  @override
  FutureOr<AuthUser?> build() {
    _repository = ref.watch(authRepositoryProvider);
    return null;
  }

  Future<void> registerUser(String email, String password) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() {
      return _repository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  Future<void> loginUser(String email, String password) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() {
      return _repository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  Future<void> logout() async {
    await _repository.signOut();
    state = AsyncData(null);
  }

  Future<void> getVerifiedUser() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() {
      return _repository.getCurrentUser();
    });
  }

  Future<void> sendEmailVerificationAgain() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<AuthUser?>(() async {
      await _repository.sendEmailVerificationAgain();
      return state.value;
    });
  }
}
