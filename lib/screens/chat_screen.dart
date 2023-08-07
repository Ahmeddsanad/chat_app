import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController ChatController = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  var CurrentTime = DateFormat('yyyy-MM-dd – hh:mm a').format(DateTime.now());

  static String id = 'ChatScreen';

  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogo, scale: 2),
            Text('Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => SizedBox(
                child: ChatBubble(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: ChatController,
              onFieldSubmitted: (data) {
                messages.add({
                  'message': data,
                  'DateTime': CurrentTime,
                });

                ChatController.clear();
              },
              onChanged: (value) {
                message = value;
              },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      24.0,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      messages.add({
                        'message': message,
                        'DateTime': CurrentTime,
                      });

                      ChatController.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.teal,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
