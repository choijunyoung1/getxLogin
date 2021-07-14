import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:getx_login/app/modules/home/controllers/message_controller.dart';
import 'package:intl/intl.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
final _fireStore = FirebaseFirestore.instance;
class MessageStream extends GetView<MessageController>{


  @override
  Widget build(BuildContext context){
    final reference = _fireStore
        .collection('chatRooms')
        .doc('groupChat1')
        .collection('chatScreen')
        .orderBy('createdAt', descending: true);
    return Expanded(
      child: Column(
        children: [
          Flexible(
            child: PaginateFirestore(
              isLive: true,
              scrollController: controller.scrollController,
              reverse: true,
              itemBuilderType: PaginateBuilderType.listView,
              itemBuilder: (index, context, snapshot) {
                return MessageBubble(
                  index: index,
                  document: snapshot,
                  isMe: controller.user.email == snapshot.data()!['sender'],
                  user: controller.user,
                );
              },
              query: reference,
            ),
          )
        ],
      ),
    );
  }
}
class MessageBubble extends StatelessWidget {
  final int index;
  final DocumentSnapshot document;
  final bool isMe;
  final firebase_auth.User user;

  MessageBubble({required this.index, required this.document, required this.isMe, required this.user});

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(document.data()!['createdAt']);
    var isRecent = DateTime.now().difference(date).inHours < 24;
    var dateFormat = isRecent
        ? DateFormat('h:mm a').format(date)
        : DateFormat('h:mm a - d/M').format(date);

    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: Row(
        children: isMe
            ? displayMyMessage(context, dateFormat)
            : displaySenderMessage(context, dateFormat),
      ),
    );
  }

  List<Widget> displaySenderMessage(context, dateFormat) {
    var theme = Theme.of(context);
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(user.photoURL!),
        ),
      ),
      Expanded(
        flex: 7,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                dateFormat.toString(),
                style: TextStyle(
                    fontSize: 10, color: theme.accentColor.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 5.0,
              ),
              document.data()!['image'] == null
                  ? Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(3.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Text(
                    "${document.data()!['text']}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              )
                  : GestureDetector(
                onTap: () {

                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
              )
            ],
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          width: 0,
          height: 0,
        ),
      )
    ];
  }

  List<Widget> displayMyMessage(context, dateFormat) {
    var theme = Theme.of(context);

    return <Widget>[
      Expanded(
        flex: 3,
        child: Container(
          width: 0,
          height: 0,
        ),
      ),
      Expanded(
        flex: 7,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              //in user chat screen, do not display user email, only display admin email
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  dateFormat.toString(),
                  style: TextStyle(
                      fontSize: 10, color: theme.accentColor.withOpacity(0.5)),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              document.data()!['image'] == null
                  ? Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(3.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Text(
                    "${document.data()!['text']}",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              )
                  : GestureDetector(
                onTap: () {

                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
              )
//                  : Tools.image(
//                      url: document.data['image'],
//                      width: 200,
//                      height: 200,
//                      fit: BoxFit.cover)
            ],
          ),
        ),
      ),
    ];
  }
}
