import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Menu')),
          ListTile(title: const Text('Message Boards'), onTap: () => Navigator.pushNamed(context, '/home')),
          ListTile(title: const Text('Profile'), onTap: () => Navigator.pushNamed(context, '/profile')),
          ListTile(title: const Text('Settings'), onTap: () => Navigator.pushNamed(context, '/settings')),
        ],
      ),
    );
  }
}
