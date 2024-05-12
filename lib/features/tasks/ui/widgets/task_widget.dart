import 'package:flutter/material.dart';
import 'package:taski/core/helpers/spacing.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7F9),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_box_outline_blank_rounded,
                color: Theme.of(context).secondaryHeaderColor,
                size: 25,
              ),
              horizontalSpace(10),
              Text(
                title,
                style: TextStyle(
                    fontSize: 15, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
