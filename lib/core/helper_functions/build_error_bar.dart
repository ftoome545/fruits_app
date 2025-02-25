import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(message),
        ],
      ),
    ),
  );
}
