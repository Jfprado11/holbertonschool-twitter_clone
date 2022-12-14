import 'package:flutter/material.dart';
import 'package:twitter/screens/edit_post_screen.dart';
import 'package:twitter/widgets/post_widget.dart';
import 'package:twitter/widgets/side_bar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const PostWidget(),
      drawer: const SideBarMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditPostScreen(),
            ),
          );
        },
        child: const Center(
            child: Icon(
          Icons.draw,
          color: Colors.white,
        )),
      ),
    );
  }
}
