import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/auth_state.dart';

import '../screens/signin_screen.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SideBarMenu();
  }
}

class _SideBarMenu extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, state, child) {
        return Drawer(
          child: FutureBuilder(
            future: state.getCurrentUserModel(),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: Divider.createBorderSide(
                            context,
                            width: 1.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      accountName: Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data!.displayName,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontFamily: 'Raleway',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              snapshot.data!.userName,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontFamily: 'Raleway',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      accountEmail: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              '${snapshot.data!.followers} Followers',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              '${snapshot.data!.following} Following',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      currentAccountPicture: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80'),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text(
                        'Profile',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () => {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.list),
                      title: const Text(
                        'Lists',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () => {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.bookmark),
                      title: const Text(
                        'Bookmark',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () => {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.flash_on),
                      title: const Text(
                        'Moments',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () => {},
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: Colors.black,
                    ),
                    ListTile(
                      title: const Text(
                        'Settings and privacy',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () => {},
                    ),
                    ListTile(
                      title: const Text(
                        'Help Center',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () => {},
                    ),
                    ListTile(
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () async {
                        await state.logout();
                        if (!mounted) return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const SignIn()),
                        );
                      },
                    ),
                  ],
                );
              }
              return const Center(child: Text('Loading..'));
            },
          ),
        );
      },
    );
  }
}
