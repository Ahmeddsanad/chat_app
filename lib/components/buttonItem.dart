// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

Widget ButtonItem({
  required VoidCallback function,
  required String text,
  required double horizontalSymmetric,
}) =>
    ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.teal[700],
        padding: EdgeInsets.symmetric(
          horizontal: horizontalSymmetric,
          vertical: 12,
        ),
      ),
      onPressed: function,
      child: Text(
        '$text',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
