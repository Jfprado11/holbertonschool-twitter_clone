import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/edit_profile_screen.dart';
import 'package:twitter/widgets/post_widget.dart';

import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  final String userID;

  const ProfileScreen({Key? key, required this.userID}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, state, child) {
        return FutureBuilder(
          future: state.getUserByID(widget.userID),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
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
                        Row(
                          children: [
                            const SizedBox(
                              width: 290.0,
                              height: 0.0,
                            ),
                            if (state.auth.currentUser?.uid ==
                                snapshot.data?.key)
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const EditProfileScreen()),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                ),
                                child: const Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            if (state.auth.currentUser?.uid !=
                                snapshot.data?.key)
                              FutureBuilder(
                                future: state.getCurrentUserModel(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<User> currentSnapshot) {
                                  if (!currentSnapshot.data!.followersList
                                      .contains(snapshot.data!.userID)) {
                                    return OutlinedButton(
                                      onPressed: () async {
                                        // first the current user updates its list
                                        final queryCurrent =
                                            state.usersRef.where(
                                          'userID',
                                          isEqualTo:
                                              currentSnapshot.data!.userID,
                                        );
                                        final user = await queryCurrent.get();
                                        user.docs[0].reference
                                            .update(<String, dynamic>{
                                          'followingList': snapshot.data!.userID
                                        });
                                        // the other user uopdates its followrs list
                                        final queryOtherUser =
                                            state.usersRef.where(
                                          'userID',
                                          isEqualTo: snapshot.data!.userID,
                                        );
                                        final otherUser =
                                            await queryOtherUser.get();
                                        otherUser.docs[0].reference
                                            .update(<String, dynamic>{
                                          'followersList':
                                              currentSnapshot.data!.userID
                                        });
                                      },
                                      style: OutlinedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                      ),
                                      child: const Text(
                                        'Follow',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }

                                  return OutlinedButton(
                                    onPressed: () async {},
                                    style: OutlinedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                    ),
                                    child: const Text(
                                      'Unfollow',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                        Container(
                          height: 110.0,
                          margin: const EdgeInsets.only(top: 10.0),
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data!.displayName,
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                snapshot.data!.userName,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                snapshot.data!.bio,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 17.0,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 10.0,
                                      right: 10.0,
                                    ),
                                    padding: const EdgeInsets.only(
                                      top: 5.0,
                                      right: 5.0,
                                      bottom: 5.0,
                                    ),
                                    child: Text(
                                      '${snapshot.data!.following} Following',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 10.0,
                                      right: 10.0,
                                    ),
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '${snapshot.data!.following} Followers',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const PostWidget(),
                        const PostWidget(),
                        const PostWidget(),
                        const PostWidget(),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
