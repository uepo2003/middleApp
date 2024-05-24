import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
export 'package:cloud_firestore/cloud_firestore.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

class DateTimeTimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const DateTimeTimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }
}

@freezed
class User with _$User {
  const factory User({
    required String uid,
    required String name,
    required String? imageUrl,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime updatedAt,
    required int bookCount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
