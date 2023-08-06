import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';

Widget ChatBubble() => Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          top: 32,
          bottom: 32,
          right: 32,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            )),
        child: Text(
          'hello im ahmed what about u?',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
