// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

Widget ButtonItem({
  required Function function,
  required String text,
}) =>
    ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.teal[700],
        padding: const EdgeInsets.symmetric(
          horizontal: 150.0,
          vertical: 12,
        ),
      ),
      onPressed: () {},
      child: Text(
        '$text',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
