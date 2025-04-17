import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  final boards = [
    {'name': 'Tech Talk', 'icon': Icons.computer},
    {'name': 'General Chat', 'icon': Icons.chat},
    {'name': 'Life Advice', 'icon': Icons.favorite},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message Boards')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: boards.length,
        itemBuilder: (context, index) {
          final board = boards[index];
          return ListTile(
            leading: Icon(board['icon'] as IconData),
            title: Text(board['name'] as String),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(boardName: board['name'] as String),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
