import 'package:middleapp/domain/backends/model/user_model.dart';
import 'package:middleapp/domain/backends/state/auth_state.dart';
import 'package:middleapp/domain/backends/state/fire_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  dynamic get getCurrentUser => ref.watch(currentUserProvider);
  @override
  FutureOr<User> build() async {
    return await fetchData();
  }

  Future<User> fetchData() async {

    final snapshot =
        await ref.watch(fireStoreProvider).collection('users')
        .doc(getCurrentUser.toString()).get();

    if (snapshot.exists) {
      final data = snapshot.data();
      final currentUserBook = User.fromJson(data!);
      return currentUserBook;
    } else {
      throw 'エラー';
    }
  }

  Future<void> add({required String uid, required String name}) async {
    final user = User(
      uid: uid,
      name: name,
      imageUrl: 'imageUrl',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bookCount: 0,
    );

 
      await ref
          .watch(fireStoreProvider)
          .collection('users')
          .doc(uid)
          .set(user.toJson());

  }

   Future<void> edit(String title, String imageUrl) async {
    
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await ref
          .watch(fireStoreProvider)
          .collection('users')
          .doc(getCurrentUser.toString())
          .update({
            'title': title,
            'imageUrl': imageUrl,});
      return fetchData();
    });
  }
}
