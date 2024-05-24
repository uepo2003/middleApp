// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookNotifierHash() => r'7c2cd79b497c61f67a289ab1a1e6beb2b3c606e4';

/// See also [BookNotifier].
@ProviderFor(BookNotifier)
final bookNotifierProvider =
    AutoDisposeAsyncNotifierProvider<BookNotifier, List<Book>>.internal(
  BookNotifier.new,
  name: r'bookNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bookNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BookNotifier = AutoDisposeAsyncNotifier<List<Book>>;
String _$allBookNotifierHash() => r'fff968ad3fd759a016699fe20a108f6c54daf17f';

/// See also [AllBookNotifier].
@ProviderFor(AllBookNotifier)
final allBookNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AllBookNotifier, List<Book>>.internal(
  AllBookNotifier.new,
  name: r'allBookNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allBookNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllBookNotifier = AutoDisposeAsyncNotifier<List<Book>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
