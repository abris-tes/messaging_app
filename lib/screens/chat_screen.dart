import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  final String boardName;
  ChatScreen({required this.boardName});

  final TextEditingController messageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text(boardName)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('boards')
                  .doc(boardName)
                  .collection('messages')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['username']),
                      subtitle: Text(data['message']),
                      trailing: Text(data['datetime']),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(child: TextField(controller: messageCtrl)),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('boards')
                        .doc(boardName)
                        .collection('messages')
                        .add({
                      'message': messageCtrl.text,
                      'username': user!.email,
                      'datetime': DateTime.now().toString(),
                      'timestamp': FieldValue.serverTimestamp(),
                    });
                    messageCtrl.clear();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
