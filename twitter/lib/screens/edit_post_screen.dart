import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/auth_state.dart';

import '../models/user.dart';

class EditPostScreen extends StatefulWidget {
  const EditPostScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditPostScreen();
  }
}

class _EditPostScreen extends State<EditPostScreen> {
  late TextEditingController _postController;

  @override
  void initState() {
    super.initState();
    _postController = TextEditingController();
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            actions: [
              TextButton(
                onPressed: () {},
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  child: const Text(
                    'Tweet',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: FutureBuilder(
              future: value.getCurrentUserModel(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(38.0),
                    child: Center(
                      child: TextField(
                        controller: _postController,
                        decoration: InputDecoration(
                          icon: CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data!.imageUrl),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return const Text('...loading');
              }),
        );
      },
    );
  }
}
