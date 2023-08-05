import 'package:flutter/material.dart';

Widget TextItem({
  required String text,
  TextEditingController? controller,
  Function(String)? onChanged,
}) {
  return TextField(
    onChanged: onChanged,
    controller: controller,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white54,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      label: Text(
        '$text',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ),
    style: const TextStyle(
      color: Colors.white,
    ),
  );
}
