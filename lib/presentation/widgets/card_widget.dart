import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String format() => DateFormat('yyyy/MM/dd').format(this);
}

class BookCard extends StatefulWidget {
  const BookCard({
    super.key,
    required this.title,
    required this.createdAt,
    required this.description,
    required this.imageUrl,
  });

  final String title;
  final DateTime createdAt;
  final String description;
  final String imageUrl;

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 217, 208, 208),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                widget.createdAt.format(),
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.description,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            width: 60,
            child: Center(
              child: Container(
                height: 100,
                width: 45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
