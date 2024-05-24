// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      bookId: json['bookId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
      url: json['url'] as String,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'url': instance.url,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'updatedAt':
          const DateTimeTimestampConverter().toJson(instance.updatedAt),
    };
