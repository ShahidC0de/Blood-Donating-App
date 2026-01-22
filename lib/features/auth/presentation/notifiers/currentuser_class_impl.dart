import 'package:blood_dontating_app/core/models/core_user.dart';
import 'package:blood_dontating_app/features/auth/domain/models/auth_user_model.dart';
import 'package:blood_dontating_app/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentuserClassImpl implements CoreCurrentUser {
  final AuthUser? _user;
  CurrentuserClassImpl(this._user);
  @override
  bool? emailVerifiedOrNot() {
    return _user?.isEmailVerified;
  }

  @override
  String? getEmail() {
    return _user?.email;
  }

  @override
  String? getId() {
    return _user?.uid;
  }
}

final currentUserProvider = Provider<CoreCurrentUser?>((ref) {
  final asyncuser = ref.watch(authNotifierProvider);
  return asyncuser.when(
    data: (user) => user != null ? CurrentuserClassImpl(user) : null,
    loading: () => null,
    error: (_, __) => null,
  );
});
