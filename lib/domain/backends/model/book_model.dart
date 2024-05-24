import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:middleapp/domain/backends/model/user_model.dart';
export 'package:cloud_firestore/cloud_firestore.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

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
class Book with _$Book {
  const factory Book({
    required String bookId,
    required String title,
    required String description,
    required String? imageUrl,
    required String url,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime updatedAt,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
