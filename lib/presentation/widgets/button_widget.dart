import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({required this.label, required this.press, super.key});

  final String label;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(
        label,
        style: const TextStyle(
            color: Color.fromARGB(255, 0, 234, 62),
            fontSize: 20,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
