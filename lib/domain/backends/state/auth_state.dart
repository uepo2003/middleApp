import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_state.g.dart';

@riverpod
Stream<User?> userChanges(UserChangesRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}

@riverpod
User? user(UserRef ref) {
  final userChanges = ref.watch(userChangesProvider);
  return userChanges.when(
    loading: () => null,
    error: (_, __) => null,
    data: (d) => d,
  );
}

@riverpod
String? currentUser(CurrentUserRef ref) {
  final userinfo = ref.watch(userProvider);
  return userinfo?.uid;
}
