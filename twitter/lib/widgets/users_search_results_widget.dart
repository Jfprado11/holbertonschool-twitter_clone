import 'package:flutter/material.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  final String name;
  final String username;
  final String bio;
  final String imgUrl;
  final bool isVerified;

  const UsersSearchResultsWidget({
    Key? key,
    required this.name,
    required this.username,
    required this.bio,
    required this.imgUrl,
    required this.isVerified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgUser = CircleAvatar(
      backgroundImage: NetworkImage(imgUrl),
      radius: 25.0,
    );

    final userDescription = SizedBox(
      width: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Text(
            bio,
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            username,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 15.0),
          )
        ],
      ),
    );

    const iconVerified = Icon(
      Icons.verified,
      color: Colors.blue,
    );

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          imgUser,
          userDescription,
          isVerified ? iconVerified : const Text('')
        ],
      ),
    );
  }
}
