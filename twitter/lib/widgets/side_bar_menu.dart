import 'package:flutter/material.dart';

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
    return Drawer(
      child: ListView(
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
            accountName: Text(
              'User Name',
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontFamily: 'Raleway',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            accountEmail: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: const Text(
                    '0 Followers',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: const Text(
                    '0 Following',
                    style: TextStyle(color: Colors.black),
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
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
