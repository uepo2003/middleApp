import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.label,
    required this.place,
    super.key,
  });

  final TextEditingController controller;
  final String label;

  final MainAxisAlignment place;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        width: 160,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: place,
              children: [Text(label)],
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              )),
            )
          ],
        ));
  }
}
