class User {
  final String key;
  String userID;
  String email;
  String userName;
  String displayName;
  String imageUrl;
  String coverImgUrl;
  String bio;
  int followers;
  int following;
  List<dynamic> followersList;
  List<dynamic> followingList;

  User({
    required this.key,
    required this.email,
    required this.displayName,
    required this.userID,
    required this.userName,
    this.imageUrl =
        'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
    this.coverImgUrl =
        'https://www.unfe.org/wp-content/uploads/2019/04/SM-placeholder.png',
    this.bio = 'No bio available',
    this.followers = 0,
    this.following = 0,
    this.followersList = const [],
    this.followingList = const [],
  });

  User.fromJson(Map<String, dynamic> map)
      : key = map['key'],
        userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        displayName = map['displayName'],
        imageUrl = map['imageUrl'],
        coverImgUrl = map['coverImgUrl'],
        bio = map['bio'],
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
      'coverImgUrl': coverImgUrl,
      'bio': bio,
      'followers': followers,
      'following': following,
      'followersList': followersList,
      'followingList': followingList,
    };
  }
}
