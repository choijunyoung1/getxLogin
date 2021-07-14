import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/controllers/chatlist_controller.dart';
import 'package:getx_login/app/modules/home/views/chat_screen.dart';
import 'package:getx_login/app/routes/app_pages.dart';
final _fireStore = FirebaseFirestore.instance;
class ChatlistView extends GetView<ChatlistController>{
  final reference = _fireStore.collection('chatRooms');
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Chat List Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Scrollbar(
          child: Container(
            child: FirestoreAnimatedList(
              query: reference,
              itemBuilder: (context,snapshot,animation,index){
                return SizeTransition(
                  sizeFactor:
                  CurvedAnimation(parent: animation, curve: Curves.easeIn),
                  child: GestureDetector(
                    onTap: (){
                      controller.routeChatScreen();
                    },
                    child: ChatItem(
                      index: index,
                      document: snapshot,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
class ChatItem extends StatelessWidget {
  final int index;
  final DocumentSnapshot document;

  ChatItem({ required this.index,  required this.document});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        color: Theme.of(context).bottomAppBarColor,
        elevation: 1.5,
        child: ListTile(
          contentPadding: const EdgeInsets.only(
              top: 10, bottom: 10, left: 20.0, right: 10.0),
          title: Text('dd'),
        ),
      ),
    );
  }
}
