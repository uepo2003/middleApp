import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:middleapp/domain/backends/model/book_model.dart';
import 'package:middleapp/domain/backends/state/auth_state.dart';
import 'package:middleapp/domain/backends/state/fire_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'book_notifier.g.dart';

@riverpod
class BookNotifier extends _$BookNotifier {
  CollectionReference get getBooks => ref.watch(getBookProvider);
  FirebaseFunctions get getFunction => ref.watch(fireFunctionProvider);
  dynamic get getCurrentUser => ref.watch(currentUserProvider);
  @override
  FutureOr<List<Book>> build() async {
    return await fetchData();
  }

  Future<List<Book>> fetchData() async {
    final snapshots =
        await getBooks.orderBy('updatedAt', descending: true).get();
    return snapshots.docs
        .map(
          (doc) => Book.fromJson(doc.data()! as Map<String, dynamic>),
        )
        .toList();
  }

  Future<void> addBook({
    required String bookId,
    required String title,
    required String description,
    required String imageUrl,
    required String url,
  }) async {
    final book = Book(
      bookId: bookId,
      title: title,
      description: description,
      imageUrl: imageUrl,
      url: url,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      try {
        final functions = getFunction.httpsCallable('addBook');
        debugPrint(getCurrentUser.toString());
        final response = await functions.call<dynamic>(<String, dynamic>{
          'userId': getCurrentUser.toString(),
          'bookId': book.bookId,
          'title': book.title,
          'description': book.description,
          'imageUrl': book.imageUrl,
          'url': book.url,
          'createdAt': book.createdAt.toIso8601String(),
          'updatedAt': book.updatedAt.toIso8601String()
        });
        debugPrint(response.data.toString());
      } on FirebaseFunctionsException catch (error) {
        debugPrint(error.code);
        debugPrint(error.details.toString());
        debugPrint(error.message);
      }
      return fetchData();
    });
  }

  Future<void> removeBook(
    String bookId,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final functions = getFunction.httpsCallable('removeBook');

        final response = await functions.call<dynamic>(<String, dynamic>{
          'userId': getCurrentUser.toString(),
          'bookId': bookId,
        });
        debugPrint(response.data.toString());
      } on FirebaseFunctionsException catch (error) {
        debugPrint(error.code);
        debugPrint(error.details.toString());
        debugPrint(error.message);
      }
      return fetchData();
    });
  }
}

@riverpod
class AllBookNotifier extends _$AllBookNotifier {
  FirebaseFirestore get getFireStore => ref.watch(fireStoreProvider);
  @override
  FutureOr<List<Book>> build() async {
    return await fetchData();
  }

  Future<List<Book>> fetchData() async {
    final snapshot = await getFireStore
        .collection('allUsersBooks')
        .orderBy('updatedAt', descending: true)
        .where('banned', isEqualTo: false)
        .get();
    return snapshot.docs
        .map(
          (doc) => Book.fromJson(doc.data()),
        )
        .toList();
  }
}
