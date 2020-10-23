import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firechat/components/message_bubble.dart';
import 'package:firechat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  MessageStream({@required FirebaseFirestore firestore,}) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot){
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data()["text"];
          final messageSender = message.data()["sender"];
          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(sender: messageSender, text: messageText,isMe: currentUser == messageSender,);
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0,),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}