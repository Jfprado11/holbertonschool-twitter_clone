import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChatsScreen();
  }
}

class _ChatsScreen extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            maxRadius: 10.0,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        title: Text(
          'Chat',
          style: TextStyle(color: Colors.grey.shade800),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
            color: Colors.blue,
          )
        ],
      ),
      body: const SafeArea(
          child: Center(
        child: Text(
          'No Chats Yet',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
      )),
    );
  }
}
