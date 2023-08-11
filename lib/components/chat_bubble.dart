import 'package:chat_app/constant.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.message});

  Message message;

  @override
  Widget build(BuildContext context) {
    // var dt =
    // DateFormat.jm().format(DateFormat("hh:mm:ss").parse(message.DateTime));

    // print(dt);

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          bottom: 12,
          right: 32,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${message.message}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              message.formattedTime,
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble2 extends StatelessWidget {
  ChatBubble2({super.key, required this.message});

  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              bottom: 12,
              right: 32,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${message.message}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  message.formattedTime,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
