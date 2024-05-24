import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'themeSystem_model.freezed.dart';

@freezed
class ThemeSystemModel with _$ThemeSystemModel {
  const factory ThemeSystemModel({
    required ThemeMode theme,
    @Default(false) bool value,
  }) = _ThemeSystemModel;
}
