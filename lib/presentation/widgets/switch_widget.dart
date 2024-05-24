import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
