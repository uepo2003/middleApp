import 'package:flutter/material.dart';
import 'package:middleapp/domain/backends/model/themeSystem_model.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'themeSystem_state.g.dart';

@Riverpod(keepAlive: true)
class ThemeSystemNotifier extends _$ThemeSystemNotifier {
  @override
  ThemeSystemModel build() {
    return const ThemeSystemModel(theme: ThemeMode.light);
  }

  void setThemeMode(ThemeSystemModel t) {
    if (t.theme == ThemeMode.light) {
      state = t.copyWith(theme: ThemeMode.system, value: true);
    } else if (t.theme == ThemeMode.system) {
      state = t.copyWith(theme: ThemeMode.light, value: false);
    }
  }
}
