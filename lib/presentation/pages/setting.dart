import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middleapp/domain/backends/state/themeSystem_state.dart';
import 'package:middleapp/domain/backends/state/themes_state.dart';
import 'package:middleapp/presentation/widgets/switch_widget.dart';

class Setting extends ConsumerStatefulWidget {
  const Setting({super.key});

  @override
  SettingState createState() => SettingState();
}

class SettingState extends ConsumerState<Setting> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider);
     final themeSystem = ref.watch(themeSystemNotifierProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: Column(
        children: [
          SwitchWidget(
            title: theme.value ? 'ダークモード' : 'ライトモード',
            value: theme.value,
            onChanged: (_) {
              setState(() {
                ref.read(themeNotifierProvider.notifier).setThemeMode(theme);
              });
            },
          ),
          SwitchWidget(
            title: 'テーマをデバイスに依存させる',
            value: themeSystem.value,
            onChanged: (_) {
              setState(() {
                ref.read(themeSystemNotifierProvider.notifier)
                .setThemeMode(themeSystem);
              });
            },
          ),
          const SizedBox(height: 50, child: Text('ログアウト')),
        ],
      ),
    );
  }
}
