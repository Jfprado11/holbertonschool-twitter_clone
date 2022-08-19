import 'package:flutter/material.dart';
import 'package:twitter/dummy_data.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen> {
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
        title: SizedBox(
          height: 45.0,
          child: TextField(
            style: const TextStyle(color: Colors.blue),
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: const TextStyle(fontSize: 17.0),
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
            color: Colors.blue,
          )
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return UsersSearchResultsWidget(
            name: userList[index]['name'],
            username: userList[index]['username'],
            bio: userList[index]['bio'],
            imgUrl: userList[index]['imgUrl'],
            isVerified: userList[index]['isVerified'],
          );
        },
      )),
    );
  }
}
