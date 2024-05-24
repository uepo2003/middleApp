import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:middleapp/domain/backends/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fire_state.g.dart';

@riverpod
FirebaseFirestore fireStore(FireStoreRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirebaseFunctions fireFunction(FireFunctionRef ref) {
  return FirebaseFunctions.instance;
}

@riverpod
CollectionReference getBook(GetBookRef ref) {
  final cu = ref.watch(currentUserProvider);
  debugPrint(cu);
  return ref
      .watch(fireStoreProvider)
      .collection('users')
      .doc(cu)
      .collection('books');
}

@riverpod
DocumentReference getUser(GetUserRef ref) {
  final cu = ref.watch(currentUserProvider);
  debugPrint(cu);
  return ref.watch(fireStoreProvider).collection('users').doc(cu);
}
