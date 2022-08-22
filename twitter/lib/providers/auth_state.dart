import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter/models/user.dart' as local_user;

enum Errors {
  none,
  matchError,
  weakError,
  existsError,
  error,
  wrongError,
  noUserError
}

class Auth extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  final usersRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<local_user.User>(
        fromFirestore: (snapshot, _) {
          return local_user.User.fromJson(
            snapshot.data() ?? {},
          );
        },
        toFirestore: (user, _) => user.toJson(),
      );

  attemptSignUp(email, name, password, passwordConfirmation) async {
    try {
      if (password != passwordConfirmation) {
        return Errors.matchError;
      }
      final userCredentials = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await usersRef.add(
        local_user.User(
          key: userCredentials.user!.uid,
          userID: userCredentials.user!.uid,
          email: email,
          userName: name,
          displayName: name,
          imageUrl:
              'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
          followers: 0,
          following: 0,
          followersList: [],
          followingList: [],
        ),
      );
      return Errors.none;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Errors.weakError;
      } else if (e.code == 'email-already-in-use') {
        return Errors.existsError;
      }
    } catch (e) {
      return Errors.error;
    }
  }

  attemptLogin(email, password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Errors.none;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Errors.noUserError;
      } else if (e.code == 'wrong-password') {
        return Errors.wrongError;
      }
    } catch (e) {
      return Errors.error;
    }
  }

  logout() async {
    await auth.signOut();
  }

  Future<local_user.User> getCurrentUserModel() async {
    final userUUid = auth.currentUser!.uid;
    final query = usersRef.where('key', isEqualTo: userUUid);
    final user = await query.get();
    return user.docs[0].data();
  }
}
