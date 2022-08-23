class Post {
  String text;
  String userID;
  int likeCount;
  List<String> likeList;

  Post({
    required this.text,
    required this.userID,
    required this.likeCount,
    required this.likeList,
  });

  Post.fromJson(Map<String, dynamic> map)
      : text = map['text'],
        userID = map['userID'],
        likeCount = map['likeCount'],
        likeList = map['likeList'];

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'userID': userID,
      'likeCount': likeCount,
      'likeList': likeList,
    };
  }
}
