import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const verifiedIcon = Padding(
      padding: EdgeInsets.all(10.0),
      child: Icon(
        Icons.verified,
        color: Colors.blue,
        size: 19.0,
      ),
    );

    final upperPost = Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0, left: 5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
              ),
              radius: 20.0,
            ),
          ),
          const Text(
            'Prado11',
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
          verifiedIcon,
          Text(
            '@prado11 · 1h',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(
            width: 45.0,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            splashRadius: 25.0,
          ),
        ],
      ),
    );

    final lowerPost = Container(
      padding: const EdgeInsets.only(left: 5.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const [
                Icon(Icons.chat_bubble_outline),
                Text('0'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.repeat),
                Text('0'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const [
                Icon(Icons.favorite_border),
                Text('0'),
              ],
            ),
          ),
          const SizedBox(width: 120.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const [
                Icon(Icons.share),
              ],
            ),
          ),
        ],
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          upperPost,
          Container(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300.0,
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'If you are a Nintendo Swithc online + Expansion Pack memeber, you can already download the Mario Kart 8',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                lowerPost,
              ],
            ),
          )
        ],
      ),
    );
  }
}
