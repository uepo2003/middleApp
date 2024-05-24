import 'package:flutter/material.dart';
import 'package:middleapp/domain/backends/model/theme_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'themes_state.g.dart';

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeModel build() {
    return const ThemeModel(theme: ThemeMode.light);
  }

  void setThemeMode(ThemeModel t) {
    if (t.theme == ThemeMode.light) {
      state = t.copyWith(theme: ThemeMode.dark, value: true);
    } else if (t.theme == ThemeMode.dark) {
      state = t.copyWith(theme: ThemeMode.light, value: false);
    }
  }
}
