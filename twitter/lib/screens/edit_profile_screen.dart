import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/auth_state.dart';

import '../models/user.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _bioController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.blue,
              onPressed: (() {
                Navigator.of(context).pop();
              }),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey.shade50,
            elevation: 0,
            title: const Text(
              'Edit profile',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ))
            ],
          ),
          body: FutureBuilder(
            future: state.getCurrentUserModel(),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasData) {
                _nameController.text = snapshot.data!.displayName;
                _bioController.text = snapshot.data!.bio;
                return SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image(
                            width: double.infinity,
                            height: 150.0,
                            image: NetworkImage(snapshot.data!.coverImgUrl),
                            fit: BoxFit.cover,
                          ),
                          FractionalTranslation(
                            translation: const Offset(0.0, 1.4),
                            child: Align(
                              alignment: const FractionalOffset(0.1, 0.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40.0,
                                child: CircleAvatar(
                                  radius: 35.0,
                                  backgroundImage: NetworkImage(
                                    snapshot.data!.imageUrl,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      TextField(
                        controller: _bioController,
                        decoration: const InputDecoration(
                          labelText: 'Bio',
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: Text('Loagin ...'),
              );
            },
          ),
        );
      },
    );
  }
}
