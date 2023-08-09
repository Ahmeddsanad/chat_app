import 'package:flutter/material.dart';

Widget TextItem({
  required String text,
  TextEditingController? controller,
  Function(String)? onChanged,
  required String? Function(String?)? validator,
  bool isObscureText = false,
  bool isPasswordField = false,
  Widget? SuffixIcon,
}) {
  return TextFormField(
    obscureText: isObscureText,
    onChanged: onChanged,
    validator: validator,
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: SuffixIcon,
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      errorStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
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
