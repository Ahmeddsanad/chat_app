import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController ChatController = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);

  var messageDateTime =
      DateFormat('yyyy-MM-dd – hh:mm a').format(DateTime.now());

  static String id = 'ChatScreen';

  String? messageOnChange;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.snapshots(),
      builder: (context, snapshot) {
        //testing data retrieval when it DocumentSnapshot
        // print(snapshot.data!['DateTime']);
        // print(snapshot.data!['message']);

        if (snapshot.hasData) {
          //testing data retrieval when it QuerySnapshot
          // print(snapshot.data!.docs[0]['message']);
          List<Message> MessagesList = [];

          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            MessagesList.add(
              Message.fromJson(snapshot.data!.docs[i]),
            );
          }

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
                    itemCount: MessagesList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => SizedBox(
                      child: ChatBubble(
                        message: MessagesList[index],
                      ),
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
                        'DateTime': messageDateTime,
                      });

                      ChatController.clear();
                    },
                    onChanged: (value) {
                      messageOnChange = value;
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
                              'message': messageOnChange,
                              'DateTime': messageDateTime,
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
        } else {
          return ModalProgressHUD(
            inAsyncCall: false,
            child: Text(
              'Loading',
            ),
          );
        }
      },
    );
  }
}
