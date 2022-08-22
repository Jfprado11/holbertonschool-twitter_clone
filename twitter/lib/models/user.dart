class User {
  final String key;
  String userID;
  String email;
  String userName;
  String displayName;
  String imageUrl;
  int followers;
  int following;
  List<dynamic> followersList;
  List<dynamic> followingList;

  User({
    required this.key,
    required this.userID,
    required this.email,
    required this.userName,
    required this.displayName,
    required this.imageUrl,
    required this.followers,
    required this.following,
    required this.followersList,
    required this.followingList,
  });

  User.fromJson(Map<String, dynamic> map)
      : key = map['key'],
        userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        displayName = map['displayName'],
        imageUrl = map['imageUrl'],
        followers = map['followers'],
        following = map['following'],
        followersList = map['followersList'],
        followingList = map['followingList'];

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'userID': userID,
      'email': email,
      'userName': userName,
      'displayName': displayName,
      'imageUrl': imageUrl,
      'followers': followers,
      'following': following,
      'followersList': followersList,
      'followingList': followingList,
    };
  }
}
